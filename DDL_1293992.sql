/*
   =====================================================================================================================
							    SQL PROJECT: Smart Restaurant Ordering Management System (SROMS)
   =====================================================================================================================

										  Trainee Name  : Najmun Naher
										  Trainee ID    : 1293992
										  Batch ID      : WADA/PNTL-M/69/01
										  Module 02    	: SQL Server

                            SECTION 01-- >>>>>>>>>>>>> CREATE OBJETCS <<<<<<<<<<<<<

		=> CREATE DATABASE [SROMS] 
		=> CREATE SEQUENCE
		=> CREATE TABLES (WITH CONSTRAINTS) 
		=> CREATE SCHEMA	
		=> CREATE INDEX (CCLUSTERED AND NONCLUSTERED)
		=> CREATE VIEWS ( WITH SCHEMABINDING, ENCRYPTION)
	    => CREATE STORED PROCEDURE
	    => CREATE USER-DEFINED FUNCTION (SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
	    => CREATE TRIGGERS (FOR/AFTER TRIGGER, INSTEAD OF TRIGGER)

		                    SECTION 02 -- >>>>>>>>>>>>>ALTER OBJETCS <<<<<<<<<<<<<
			
		=> ALTER TABLES
		=> ALTER SEQUENCE
		=> ALTER INDEX 
		=> ALTER VIEWS 
		=> ALTER STORED PROCEDURE
		=> ALTER USER-DEFINED FUNCTION 
		=> ALTER TRIGGERS

                         SECTION 03-- >>>>>>>>>>>>> DROP OBJETCS <<<<<<<<<<<<<	

    	=> DROP SEQUENCE
		=> DROP TABLES 
		=> DROP SCHEMA	
		=> DROP INDEX 
		=> DROP VIEWS 
		=> DROP STORED PROCEDURE
		=> DROP USER-DEFINED FUNCTION 
		=> DROP TRIGGERS


*/

           /***************************************************************************************
									      SECTION 01---	CREATE OBJETCS											
            ***************************************************************************************/

USE master
GO

                          -- ==================================================== --
								         --  CREATE DATABASE --
                          -- ==================================================== --

-- Check if the database already exists and drop it if it does
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'SROMS')
BEGIN
	    ALTER DATABASE SROMS
	    SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	    DROP DATABASE SROMS
	    PRINT 'Existing database SROMS was dropped.'
END
GO

-- Create the new SROMS with Primary, FileStream, and Log filegroups
CREATE DATABASE SROMS
ON 
PRIMARY ( 
	    NAME = SROMS_Data, 
	    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\\SROMS_Data.mdf', 
	    SIZE = 50MB, 
	    MAXSIZE = 500MB, 
	    FILEGROWTH = 10%
)
LOG ON ( 
	    NAME = SROMS_Log, 
	    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\\SROMS_Log.ldf', 
	    SIZE = 20MB, 
	    MAXSIZE = 100MB, 
	    FILEGROWTH = 5MB
)
GO
-- Verify that the database was created successfully
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'SROMS')
BEGIN
    PRINT 'Database SROMS created successfully.';
END
ELSE
BEGIN
    PRINT 'Error: Database creation failed.';
END
GO

USE SROMS
GO

                             --=====================================================--
                                           --  CREATE SEQUENCE --
                             --=====================================================--

-- Create a sequence that starts at 1 and increments by 1
CREATE SEQUENCE seqOrderNo
    START WITH 1 
    MINVALUE 1			
    MAXVALUE 1000	
    CYCLE					
    CACHE 10
    GO

	                     --=====================================================--
                                            -- CREATE TABLE --
                         --=====================================================--
CREATE TABLE restaurantTable
(
    tableID     INT IDENTITY PRIMARY KEY,
    tableNumber INT NOT NULL,
    tableStatus VARCHAR(20) NOT NULL
)
GO
CREATE TABLE menuCategory
(
    categoryID INT IDENTITY PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
)
GO
CREATE TABLE menuItem
(
    itemID INT IDENTITY PRIMARY KEY,
    itemName VARCHAR(100) NOT NULL,
    categoryID INT NOT NULL,
    price MONEY NOT NULL, 

    CONSTRAINT FK_MenuItem_Category
        FOREIGN KEY (CategoryID)
        REFERENCES menuCategory(CategoryID),
    CONSTRAINT chk_Price CHECK (Price > 0)
  
)
GO

CREATE TABLE orderMaster
(
    orderID INT IDENTITY PRIMARY KEY,
    tableID INT NOT NULL,
    orderTime DATETIME NOT NULL DEFAULT GETDATE(),
    orderStatus VARCHAR(30),
    estimatedReadyTime DATETIME, 

    CONSTRAINT FK_OrderMaster_Table
        FOREIGN KEY (tableID)
        REFERENCES restaurantTable(tableID)

)
GO
CREATE TABLE orderDetails
(
    orderDetailID INT IDENTITY PRIMARY KEY,
    orderID INT NOT NULL,
    itemID INT NOT NULL,
    quantity INT NOT NULL,
    notes VARCHAR(255),

    CONSTRAINT FK_OrderDetails_Order
        FOREIGN KEY (OrderID)
        REFERENCES OrderMaster(OrderID),

    CONSTRAINT FK_OrderDetails_Item
        FOREIGN KEY (ItemID)
        REFERENCES MenuItem(ItemID)
)
GO

CREATE TABLE kitchenActivityLog
(
    logID INT IDENTITY PRIMARY KEY,
    orderID INT NOT NULL,
    statusBefore VARCHAR(30),
    statusAfter VARCHAR(30),
    atUpdated DATETIME NOT NULL DEFAULT GETDATE(),
    updatedBy VARCHAR(50),

    CONSTRAINT FK_KitchenLog_Order
        FOREIGN KEY (OrderID)
        REFERENCES OrderMaster(OrderID)
)
GO
CREATE TABLE customer
(
    customerID INT IDENTITY(1,1) NOT NULL,
    customerName VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    createdAt DATETIME NOT NULL DEFAULT GETDATE()
   
)
GO


                            --=====================================================--
                                                -- CREATE SCHEMA --
                            --=====================================================--
CREATE SCHEMA APP
GO
CREATE SCHEMA pay
GO
CREATE TABLE pay. paymentMethod
(
    paymentMethodID INT IDENTITY PRIMARY KEY,
    methodName VARCHAR(50) NOT NULL,
    isDigital BIT NOT NULL,
    serviceCharge MONEY CHECK (serviceCharge>0),
    [status] VARCHAR(20) NOT NULL
)
GO
CREATE TABLE pay.payment
(
    paymentID INT IDENTITY PRIMARY KEY,
    orderID INT NOT NULL,
    amount MONEY NOT NULL CHECK (amount>0),
    paymentMethodID INT NOT NULL,
    paymentTime DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Payment_Order
        FOREIGN KEY (OrderID)
        REFERENCES OrderMaster(OrderID),

    CONSTRAINT FK_Payment_Method
        FOREIGN KEY (PaymentMethodID)
        REFERENCES pay.PaymentMethod(PaymentMethodID)
)
GO
      

                              --=====================================================--
                                                 --	INDEX --
                              --=====================================================--

 -- Create Clustered Index 
CREATE CLUSTERED INDEX ixcustomerID
ON customer (customerID)
GO
 -- Create Non-Clustered Index

CREATE NONCLUSTERED INDEX IX_MenuItem_Price
ON menuItem(Price)
GO

-- Create Unique Index 
CREATE UNIQUE INDEX ixcustomerphn
ON customer(phone)
GO

                                   --=====================================================--
                                                    --	VIEWS --
                                     --=====================================================--

--  Simple View:
--1
CREATE VIEW vw_customer AS
SELECT customerID, customerName, phone, email, createdAt
FROM customer
GO

--
CREATE VIEW pay.vPaymentDetails
AS
SELECT 
    p.PaymentID,
    p.OrderID,
    p.Amount,
    pm.MethodName,
    pm.IsDigital,
    p.PaymentTime
FROM pay.Payment p
JOIN pay.PaymentMethod pm
    ON p.PaymentMethodID = pm.PaymentMethodID
GO
--2
CREATE VIEW vw_OrderDetails
AS
SELECT 
    o.orderID,
    o.tableID,
    o.orderStatus,
    od.itemID,
    i.itemName,
    od.quantity
FROM orderMaster o
JOIN orderDetails od ON o.orderID = od.orderID
JOIN menuItem i ON od.itemID = i.itemID
GO

--View with Aggregation (Total Payment by Method)

CREATE VIEW pay.vTotalPaymentByMethod
AS
SELECT 
    pm.MethodName,
    COUNT(p.PaymentID) AS TotalTransactions,
    SUM(p.Amount) AS TotalAmount
FROM pay.Payment p
JOIN pay.PaymentMethod pm
    ON p.PaymentMethodID = pm.PaymentMethodID
GROUP BY pm.MethodName
GO

--View with JOIN (Order + Payment Info)

CREATE VIEW pay.vOrderPaymentInfo
AS
SELECT 
    o.OrderID,
    o.OrderStatus,
    p.Amount,
    p.PaymentTime
FROM OrderMaster o
JOIN pay.Payment p
    ON o.OrderID = p.OrderID
GO

--View with ENCRYPTION

CREATE VIEW pay.vEncryptedPayment
WITH ENCRYPTION
AS
SELECT PaymentID, OrderID, Amount
FROM pay.Payment
GO

--View with SCHEMABINDING

CREATE VIEW pay.SchemaBoundPayment
WITH SCHEMABINDING
AS
SELECT PaymentID, OrderID, Amount, PaymentMethodID
FROM pay.Payment
GO
--View with ENCRYPTION + SCHEMABINDING

CREATE VIEW pay.EncryptedSchemaBoundPayment
WITH ENCRYPTION, SCHEMABINDING
AS
SELECT PaymentID, OrderID, Amount
FROM pay.Payment
GO

                           --=====================================================--
                                           --STORED PROCEDURE  --
                            --=====================================================--
--Insert Stored Procedure 

CREATE PROC pay.spInsertPayment
    @paymentID INT,
    @orderID INT,
    @amount MONEY,
    @PaymentMethodID INT,
    @paymentTime DATETIME
    
   
AS
BEGIN
    BEGIN TRY
        INSERT INTO pay.Payment
        (paymentID, orderID, Amount,PaymentMethodID, paymentTime)
        VALUES
        (@paymentID, @orderID,@Amount,@PaymentMethodID, @paymentTime)

        PRINT 'Payment inserted successfully.'
    END TRY
    BEGIN CATCH
        RAISERROR('Error occurred while inserting payment.',16,1)
    END CATCH
END
GO

--Update Stored Procedure

CREATE PROCEDURE pay.spUpdatePaymentStatus
    @PaymentID INT,
    @Amount MONEY
    
AS
BEGIN
    UPDATE pay.Payment
    SET amount = @Amount
    WHERE PaymentID = @PaymentID

    IF @@ROWCOUNT = 0
        RAISERROR('No payment found with this ID.',16,1)
    ELSE
        PRINT 'Payment status updated successfully.'
END
GO

--Delete Stored Procedure

CREATE PROCEDURE pay.spDeletePayment
    @PaymentID INT
AS
BEGIN
    DELETE FROM pay.Payment
    WHERE PaymentID = @PaymentID

    PRINT 'Payment deleted successfully.'
END
GO

----Stored Procedure with OUTPUT Parameter
--1
CREATE PROCEDURE pay.spGetPaymentDetails
    @PaymentID INT
AS
BEGIN
    SELECT 
       p.paymentID INT,
       p.orderID INT,
       p.amount MONEY,
       p.PaymentMethodID INT,
       p.paymentTime DATETIME
        
    FROM pay.Payment p
    JOIN pay.PaymentMethod pm 
        ON p.PaymentMethodID = pm.PaymentMethodID
    WHERE p.PaymentID = @PaymentID
END
GO

--2

CREATE PROCEDURE pay.spTotalPaymentByUser
    @paymentID INT,
    @TotalAmount DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT @TotalAmount = SUM(Amount)
    FROM pay.Payment
    WHERE paymentID = @paymentID
END
GO

--Stored Procedure with RETURN Value

CREATE PROCEDURE pay.spCheckPaymentExist
    @PaymentID INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM pay.Payment WHERE PaymentID = @PaymentID)
        RETURN 1
    ELSE
        RETURN 0
END
GO

            --=========================USER DEFINED FUNCTION SECTION====================================

--Scalar Function 

CREATE FUNCTION pay.fnTotalPaymentAmount (@paymentID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2)

    SELECT @Total = ISNULL(SUM(Amount),0)
    FROM pay.Payment
    WHERE paymentID = @paymentID

    RETURN @Total
END
GO
--Simple Table Valued Function

CREATE FUNCTION pay.fnGetAllPaymentMethods()
RETURNS TABLE
AS
RETURN
(
    SELECT PaymentMethodID
    FROM pay.PaymentMethod
    WHERE isDigital = 1
)
GO

                               --=====================================================--
                                                  --	TRIGGER	--
                               --=====================================================--


-- ================================  AFTER TRIGGER  ================================

--AFTER INSERT TRIGGER

CREATE TRIGGER trg_AfterInsert_OrderMaster
ON orderMaster
WITH EXECUTE AS SELF
AFTER INSERT
AS
BEGIN
    INSERT INTO kitchenActivityLog (orderID, statusAfter)
    SELECT orderID, 'Order Created'
    FROM inserted
END
GO

--AFTER UPDATE TRIGGER

CREATE TRIGGER trg_AfterUpdate_OrderStatus
ON orderMaster
WITH EXECUTE AS SELF
AFTER UPDATE
AS
BEGIN
    IF UPDATE(orderStatus)
    BEGIN
        INSERT INTO kitchenActivityLog
        (orderID, statusBefore, statusAfter)
        SELECT 
            d.orderID,
            d.orderStatus,
            i.orderStatus
        FROM deleted d
        JOIN inserted i
        ON d.orderID = i.orderID
    END
END
GO

--AFTER DELETE TRIGGER

CREATE TRIGGER trg_AfterDelete_Order
ON orderMaster
WITH EXECUTE AS SELF
AFTER DELETE
AS
BEGIN
    INSERT INTO kitchenActivityLog (orderID, statusAfter)
    SELECT orderID, 'Order Deleted'
    FROM deleted
END
GO


-- =====================================  INSTEAD OF TRIGGER  =========================================

--INSTEAD OF INSERT TRIGGER

CREATE TRIGGER trg_InsteadInsert_MenuItem
ON menuItem
WITH EXECUTE AS SELF
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE price <= 0
    )
    BEGIN
        RAISERROR('Price must be positive',16,1)
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        INSERT INTO menuItem (itemName, categoryID, price)
        SELECT itemName, categoryID, price
        FROM inserted
    END
END
GO

--INSTEAD OF DELETE TRIGGER

CREATE TRIGGER trg_InsteadDelete_PaymentMethod
ON pay.paymentMethod
WITH EXECUTE AS SELF
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deleted d
        JOIN pay.payment p
        ON d.paymentMethodID = p.paymentMethodID
    )
    BEGIN
        RAISERROR('Payment method already used',16,1)
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        DELETE FROM pay.paymentMethod
        WHERE paymentMethodID IN (SELECT paymentMethodID FROM deleted)
    END
END
GO

--=====================================INSTEAD OF trigger on a VIEW================================

--INSTEAD OF INSERT TRIGGER

CREATE TRIGGER trg_InsteadInsert_vw_OrderDetails
ON vw_OrderDetails
WITH EXECUTE AS SELF
INSTEAD OF INSERT
AS
BEGIN
    -- Insert into orderDetails table
    INSERT INTO orderDetails (orderID, itemID, quantity)
    SELECT orderID, itemID, quantity
    FROM inserted
END
GO

--INSTEAD OF UPDATE TRIGGER

CREATE TRIGGER trg_InsteadUpdate_vw_OrderDetails
ON vw_OrderDetails
WITH EXECUTE AS SELF
INSTEAD OF UPDATE
AS
BEGIN
    UPDATE od
    SET quantity = i.quantity
    FROM orderDetails od
    JOIN inserted i
    ON od.orderID = i.orderID
    AND od.itemID = i.itemID
END
GO
--INSTEAD OF DELETE TRIGGER

CREATE TRIGGER trg_InsteadDelete_vw_OrderDetails
ON vw_OrderDetails
WITH EXECUTE AS SELF
INSTEAD OF DELETE
AS
BEGIN
    DELETE od
    FROM orderDetails od
    JOIN deleted d
    ON od.orderID = d.orderID
    AND od.itemID = d.itemID
END
GO


                           /*********************************************************************
                                   SECTION 02  >>>>>>>>>>>>>>> ALTER OBJECTS <<<<<<<<<<<<<<
                           *********************************************************************/
-- ALTER TABLE
 ALTER TABLE MenuItem
ADD IsAvailable BIT DEFAULT 1
GO
--ALTER SEQUENCE

ALTER SEQUENCE Seq_OrderNo
START WITH 2
GO
--ALTER INDEX
ALTER INDEX IX_MenuItem_Price
ON MenuItem
REBUILD;
GO

--ALTER TRIGGER
ALTER TRIGGER trg_AfterOrderInsert
ON OrderMaster
AFTER INSERT
AS
BEGIN
    PRINT 'Order Inserted Successfully';
END
GO
     
                     /*********************************************************************
                          SECTION 03  >>>>>>>>>>>>>>> DROP OBJECTS <<<<<<<<<<<<<<
                    *********************************************************************/


DROP TRIGGER app.trg_InsteadDeleteOrder
GO

DROP FUNCTION pay.fnTotalPaymentAmount
GO

DROP PROCEDURE pay.spUpdatePaymentStatus
GO

DROP VIEW pay.vOrderPaymentInfo
GO

DROP INDEX IX_MenuItem_Price ON app.MenuItem
GO

DROP SEQUENCE Seq_OrderNo
GO

DROP SCHEMA app
GO
                         /*********************************************************************
                               SECTION 04  >>>>>>>>>>>>>>> LOGIN, USER, PERMISSION <<<<<<<<<<<<<<
                           *********************************************************************/
-- CREATE LOGIN
CREATE LOGIN SROMS_Login
WITH PASSWORD = 'P@ssw0rd123';
GO

-- CREATE USER
CREATE USER SROMS_User
FOR LOGIN SROMS_Login;
GO

-- GRANT PERMISSION
GRANT SELECT, INSERT, UPDATE
ON DATABASE::SROMS
TO SROMS_User;
GO
                            
                            
                           --======================================================================
                                    -->>>>>>>>>>>>>>> END OF THE DDL <<<<<<<<<<<<<<
                          --========================================================================