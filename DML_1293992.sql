/*
   =====================================================================================================================
							    SQL PROJECT: Smart Restaurant Ordering Management System (SROMS)
   =====================================================================================================================

										  Trainee Name  : Najmun Naher
										  Trainee ID    : 1293992
										  Batch ID      : WADA/PNTL-M/69/01
										  Module 02    	: SQL Server


--------------------------------------------------------------------------------------------------------------------------------------------------------------
                                             DOCUMENT STRUCTURE: DML                                                          
--------------------------------------------------------------------------------------------------------------------------------------------------------------


	=> SECTION 01: INSERT DATA INTO TABLES										
		   - Purpose: Insert or select data into/from tables. 
		   - Coverage:
			:: INSERT INTO :: SELECT INTO

	=> SECTION 02: USING AN INDEX														
			 - Purpose: Perform DML operations with indexed tables.
	=> SECTION 03: INSERT, UPDATE, DELETE USING A VIEW						
			- Purpose: Execute DML operations via views.

	=> SECTION 04: INSERT, UPDATE, DELETE USING STORED PROCEDURE		
			- Purpose: Perform data manipulation using stored procedures.	

	=> SECTION 05: RETRIEVE DATA USING USER-DEFINED FUNCTIONS (UDF)	
			 - Purpose: Retrieve and manipulate data via UDFs.

	=> SECTION 06: DML OPERATIONS WITH TRIGGERS								
			  - Purpose: Automate DML operations with triggers.
	=> SECTION 07: DML QUERIES														
			   - Coverage:
				:: All types of JOIN								      
				:: ALL, DISTINCT, TOP, PERCENT, WITH TIES
				:: String Expressions, Concatenate				       
				:: GROUP BY, HAVING
				:: Arithmetic Expressions							  
				:: ROLLUP, CUBE, GROUPING SETS
				:: Logical Operator (AND, OR, NOT)							
				:: Comparison Operator, BETWEEN
				:: Range of Selected Rows (OFFSET FETCH)		  
				:: Compound Join
				:: UNION, UNION ALL, EXCEPT, INTERSECT   
				:: GROUP BY, HAVING
				:: Subqueries											   
				:: CTE, Recursive CTE
				:: MERGE												   
				:: CAST, CONVERT, TRY_CONVERT
				:: Other Data Conversion Functions				   
				:: Numeric Functions
				:: Date Functions										   
				:: COALESCE, ISNULL, CASE
				:: IIF, CHOOSE										   
				:: Temporary Tables, Table Variables
				:: Ranking Functions								  	   
				:: Analytic Functions
				:: System Stored Procedures						   
				:: Transactions with Save Points
				:: Transactions										   
				:: Locking and Lock Modes
				:: Deadlock Prevention								   
				:: Application Roles
				:: Collations											   
				:: Code Scripts
				:: TRY-CATCH block to handle errors			   
				:: Cursor in SQL Server

	=> SECTION 08: DECLARE VARIABLES													
			  - Purpose: Use SQL variables for dynamic queries.
==================================================================================
*/

USE SROMS
GO


/* ==============================  SECTION 01  ==============================
								INSERT DATA INTO TABLES	
==========================================================================*/


-- INSERT INTO restaurantTable

INSERT INTO restaurantTable (tableNumber, tableStatus) VALUES
(1,'Available'),
(2,'Available'),
(3,'Occupied'),
(4,'Available'),
(5,'Reserved'),
(6,'Available'),
(7,'Occupied'),
(8,'Available'),
(9,'Available'),
(10,'Reserved'),
(11,'Available'),
(12,'Occupied'),
(13,'Available'),
(14,'Available'),
(15,'Reserved')
GO
-- INSERT INTO menuCategory

INSERT INTO menuCategory (categoryName) VALUES
('Popular'),
('Set Menu'),
('Appeitizer'),
('Soup'),
('Meat Box'),
('Pizza'),
('Packsges'),
('Chowmein'),
('Salad'),
('Paratha & Naan'),
('Burger'),
('Kabab & Grill'),
('Dessert'),
('Drinks')

GO

-- INSERT INTO customer
INSERT INTO customer (customerName, phone, email) VALUES
('Rahim Uddin','01710000001','rahim@gmail.com'),
('Karim Ahmed','01710000002','karim@gmail.com'),
('Salma Akter','01710000003','salma@gmail.com'),
('Nusrat Jahan','01710000004','nusrat@gmail.com'),
('Hasan Ali','01710000005','hasan@gmail.com'),
('Rafi Hossain','01710000006','rafi@gmail.com'),
('Anika Rahman','01710000007','anika@gmail.com'),
('Shuvo Islam','01710000008','shuvo@gmail.com'),
('Sadia Noor','01710000009','sadia@gmail.com'),
('Imran Khan','01710000010','imran@gmail.com'),
('Tania Sultana','01710000011','tania@gmail.com'),
('Arif Mahmud','01710000012','arif@gmail.com'),
('Mizanur Rahman','01710000013','mizan@gmail.com'),
('Farhana Yasmin','01710000014','farhana@gmail.com'),
('Jahid Hasan','01710000015','jahid@gmail.com'),
('Sumaiya Akter','01710000016','sumaiya@gmail.com'),
('Nazmul Hossain','01710000017','nazmul@gmail.com'),
('Puja Saha','01710000018','puja@gmail.com'),
('Sabbir Ahmed','01710000019','sabbir@gmail.com'),
('Nabila Islam','01710000020','nabila@gmail.com'),
('Rony Talukder','01710000021','rony@gmail.com'),
('Ishrat Jahan','01710000022','ishrat@gmail.com')

GO

-- INSERT INTO menuItem

INSERT INTO menuItem (itemName, price, categoryId) VALUES
-- Popular
('Chicken Fry',220,1),
('Beef Burger',280,1),
('French Fries',120,1),

-- Set Menu
( 'Set Menu 1',350,2),
( 'Set Menu 2',220,2),
( 'Set Menu 3',360,2),
( 'Set Menu 4',420,2),
( 'Set Menu 5',350,2),
( 'Set Menu 6',520,2),
( 'Set Menu 7',250,2),
( 'Set Menu 8',340,2),

-- Appeitizer
('Mozza Cheesy Bites',250,3),
('Chicken Wonton',240,3),
('Broast Chicken',210,3),
('Crispy Fried Chicken',140,3),
('Cheesy Frence Fries',300,3),
('Frence Fries',140,3),
('Special Chicken Wonton',250,3),
('Chicken Wonton',400,3),
('Spring Roll',250,3),
('Naga Wings',240,3),
('Chicken Bucket',750,3),
('Chicken Cheese Bomb',340,3),


-- Soup
('Thai Soup',280,4),
('Chicken Corn Soup',160,4),
('Special Corn Soup',250,4),
('Thai Soup with Wonton',300,4),

-- Meat Box
('BBQ Meat Box',480,5),
('Grilled Meat Box',520,5),
('Sausage Delight Meat Box',480,5),
('Chicken Meat Box',520,5),
('Naga Blast Meat Box',480,5),
('Cheese Bomb Meat Box',520,5),



-- Pizza
('Chicken Pizza Small',450,6),
('Beef Pizza Medium',650,6),

-- Packsges
('Family Package',1200,7),
('Couple Package',850,7),

-- Chowmein
('Chicken Chowmein',220,8),
('Vegetable Chowmein',180,8),

-- Salad
('Green Salad',130,9),
('Chicken Salad',220,9),

-- Paratha & Naan
('Butter Naan',40,10),
('Plain Paratha',35,10),

-- Burger
('Chicken Burger',220,11),
('Cheese Burger',260,11),

-- Kabab & Grill
('Chicken Shish Kabab',300,12),
('Beef Seekh Kabab',340,12),

-- Dessert
('Chocolate Cake',180,13),
('Ice Cream',120,13),

-- Drinks
('Cold Coffee',150,14),
('Soft Drinks',40,14)

GO

-- INSERT INTO orderMaster
INSERT INTO orderMaster ( tableId, orderStatus) VALUES
(3,'Completed'),
(5,'Completed'),
(7,'Completed'),
(2,'Completed'),
(10,'Completed'),
(1,'Completed'),
(4,'Processing'),
(6,'Processing'),
(8,'Pending'),
(9,'Pending'),
(1,'Completed'),
(5,'Completed'),
(12,'Completed'),
(2,'Completed'),
(10,'Completed'),
(14,'Completed'),
(4,'Processing'),
(11,'Processing'),
(13,'Pending'),
(9,'Pending'),
(11,'Processing'),
(13,'Pending'),
(2,'Pending')
GO

-- INSERT INTO orderDetails

INSERT INTO orderDetails (orderId, itemId, quantity) VALUES
(1,1,2),
(1,6,1),
(2,4,1),
(2,21,2),
(3,13,1),
(3,18,1),
(4,9,2),
(4,20,1),
(5,15,1),
(5,26,2),
(6,7,2),
(6,28,1),
(7,2,1),
(7,23,2),
(8,12,1),
(8,30,2),
(9,17,1),
(9,25,1),
(10,5,2),
(10,27,1)

GO
-- INSERT INTO paymentMethod

INSERT INTO pay.paymentMethod (methodName, isDigital, serviceCharge, [status])
VALUES 
('Cash', 0, 10.00, 'Active'),
('Credit Card', 1, 25.00, 'Active'),
('Debit Card', 1, 15.00, 'Inactive'),
('Mobile Banking', 1, 12.50, 'Active'),
('PayPal', 1, 20.00, 'Active'),
('Bank Transfer', 0, 30.00, 'Inactive')
GO

-- INSERT INTO payment
INSERT INTO pay.payment (orderID, amount, paymentMethodID)
VALUES 
(1, 500.00, 1),
(2, 1200.00, 2),
(3, 750.00, 3),
(4, 300.00, 4),
(5, 950.00, 5),
(6, 1500.00, 6),
(7, 400.00, 1),
(8, 2200.00, 2),
(9, 1250.00, 3),
(10, 600.00, 4),
(11, 800.00, 5),
(12, 1750.00, 6),
(13, 450.00, 1),
(14, 1350.00, 2),
(15, 900.00, 3),
(16, 550.00, 4),
(17, 2000.00, 5),
(18, 2500.00, 6),
(19, 700.00, 1),
(20, 1600.00, 2)
GO
-- INSERT INTO kitchenActivityLog 

INSERT INTO kitchenActivityLog (orderID, statusBefore, statusAfter, updatedBy)
VALUES
(1, 'Pending', 'Cooking', 'Chef Rahim'),
(2, 'Cooking', 'Ready', 'Chef Karim'),
(3, 'Pending', 'Cooking', 'Chef Salma'),
(4, 'Cooking', 'Ready', 'Chef Hasan'),
(5, 'Ready', 'Served', 'Waiter Ali'),
(6, 'Pending', 'Cooking', 'Chef Rahim'),
(7, 'Cooking', 'Ready', 'Chef Karim'),
(8, 'Ready', 'Served', 'Waiter Mina'),
(9, 'Pending', 'Cooking', 'Chef Salma'),
(10, 'Cooking', 'Ready', 'Chef Hasan')

GO



/*
==============================  SECTION 02  ==============================
							USING AN INDEX	
==========================================================================
*/

SELECT * FROM menuItem
WHERE itemID =10
GO

SELECT * FROM menuCategory
WHERE categoryID =3
GO

/*
==============================  SECTION 03 ==============================
					INSERT, UPDATE, DELETE USING A VIEW
==========================================================================
*/


-- To insert data through the view:

INSERT INTO vw_customer (customerName, phone, email)
VALUES ('John Doe', '1234567890', 'john@example.com')
GO

-- To update data through the view:

UPDATE vw_customer
SET phone = '0987654321', email = 'john.doe@example.com'
WHERE customerID = 1
GO
-- To delete a row through the view:
DELETE FROM vw_customer
WHERE customerID = 1
GO

/*
==============================  SECTION 04  ==============================
						INSERT UPDATE DELETE DATA USING STORED PROCEDURE
==========================================================================
*/


--1
DECLARE @paymentTime DATETIME = GETDATE();

EXEC pay.spInsertPayment
    @paymentID = 1,
    @orderID = 101,
    @amount = 500.00,
    @PaymentMethodID = 2,
    @paymentTime = @paymentTime
	GO

--3

EXEC pay.spUpdatePaymentStatus
    @PaymentID = 1,
    @Amount = 600.00
	
	GO

--4
EXEC pay.spDeletePayment
    @PaymentID = 1
	GO
--5
DECLARE @Exists INT;

EXEC @Exists = pay.spCheckPaymentExist @PaymentID = 1;

IF @Exists = 1
    PRINT 'Payment exists.';
ELSE
    PRINT 'Payment does not exist.'

--6
DECLARE @TotalAmount DECIMAL(10,2);

EXEC pay.spTotalPaymentByUser
    @paymentID = 1,
    @TotalAmount = @TotalAmount OUTPUT;

PRINT 'Total Payment: ' + CAST(@TotalAmount AS VARCHAR(20))

/*
==============================  SECTION 05  ==============================
								RETREIVE DATA USING FUNCTION
==========================================================================
*/

-- Usage of Scalar-Valued Function:
DECLARE @Total MONEY
SET @Total = pay.fnTotalPaymentAmount(101);  
PRINT 'Total Payment Amount: ' + CAST(@Total AS NVARCHAR(20))
GO

--Usage of Table-Valued Function
SELECT *
FROM pay.fnGetAllPaymentMethods()
GO
--Using the Function in a Query With Filtering

SELECT PaymentID, pay.fnTotalPaymentAmount(PaymentID) AS TotalPayment
FROM pay.Payment
WHERE pay.fnTotalPaymentAmount(PaymentID) > 200;
GO

/*
==============================  SECTION 06 ==============================
					 INSERT, UPDATE, DELETE DATA USING TRIGGER
==========================================================================
*/
-- AFTER INSERT Trigger (INSERT INTO orderMaster)
INSERT INTO orderMaster (tableID, orderStatus, estimatedReadyTime)
VALUES (1, 'Pending', DATEADD(MINUTE, 30, GETDATE()))
GO

-- Check kitchenActivityLog created by trigger
SELECT *
FROM kitchenActivityLog
WHERE orderID = SCOPE_IDENTITY()
GO

-- AFTER UPDATE Trigger (UPDATE orderMaster)

UPDATE orderMaster
SET orderStatus = 'Preparing'
WHERE orderID = 1
GO

-- Check kitchenActivityLog for before and after status
SELECT *
FROM kitchenActivityLog
WHERE orderID = 1
ORDER BY atUpdated
GO

--INSTEAD OF INSERT trigger (INSERT INTO menuItem)

-- Valid price (should work)
INSERT INTO menuItem (itemName, categoryID, price)
VALUES ('Pizza', 1, 350)
GO

-- Invalid price (price <= 0, trigger should rollback)
INSERT INTO menuItem (itemName, categoryID, price)
VALUES ('Free Item', 1, 0)
GO



/*
==============================  SECTION 07  ==============================
								DML QUERIES
==========================================================================
*/

------------------- All Types of JOIN -------------------

--INNER JOIN

SELECT o.orderID, r.tableNumber, o.orderStatus
FROM orderMaster o
INNER JOIN restaurantTable r
ON o.tableID = r.tableID
GO

--LEFT JOIN

SELECT o.orderID, p.amount
FROM orderMaster o
LEFT JOIN pay.payment p
ON o.orderID = p.orderID
GO

--RIGHT JOIN

SELECT o.orderID, p.amount
FROM orderMaster o
RIGHT JOIN pay.payment p
ON o.orderID = p.orderID

GO

--FULL OUTER JOIN

SELECT o.orderID, p.amount
FROM orderMaster o
FULL OUTER JOIN pay.payment p
ON o.orderID = p.orderID
GO

--CROSS JOIN

SELECT i.itemName, c.categoryName
FROM menuItem i
CROSS JOIN menuCategory c
GO

--SELF JOIN

SELECT a.itemName, b.itemName
FROM menuItem a
JOIN menuItem b
ON a.categoryID = b.categoryID
AND a.itemID <> b.itemID
GO

--============== SELECT ALL, DISTINCT, TOP, PERCENT, WITH TIES   ============--

--DISTINCT

SELECT DISTINCT orderStatus
FROM orderMaster
GO

--TOP

SELECT TOP 5 *
FROM menuItem
ORDER BY price DESC
GO

--TOP WITH TIES

SELECT TOP 3 WITH TIES *
FROM menuItem
ORDER BY price DESC
GO

--TOP PERCENT



SELECT TOP 20 PERCENT *
FROM menuItem
ORDER BY price DESC
GO

--ALL

SELECT *
FROM menuItem
WHERE price > ALL (
    SELECT AVG(price)
    FROM menuItem
)
GO
--============== String Expressions, Concatenate   ============--
--CONCAT

SELECT 
    CONCAT(i.itemName, ' - ', c.categoryName) AS FullName
FROM menuItem i
JOIN menuCategory c
ON i.categoryID = c.categoryID
GO

--UPPER / LOWER
SELECT UPPER(customerName) AS NameUpper
FROM customer
GO


--LEN
SELECT customerName, LEN(customerName) AS NameLength
FROM customer
GO

--==============  GROUP BY, HAVING   ============--
--GROUP BY


SELECT categoryID, COUNT(*) AS TotalItems
FROM menuItem
GROUP BY categoryID
GO

--HAVING


SELECT categoryID, COUNT(*) AS TotalItems
FROM menuItem
GROUP BY categoryID
HAVING COUNT(*) > 2
GO

--==============  Arithmetic Expressions   ============--
--Total Price (quantity × price)
SELECT 
    od.orderID,
    i.itemName,
    od.quantity,
    i.price,
    od.quantity * i.price AS TotalPrice
FROM orderDetails od
JOIN menuItem i
ON od.itemID = i.itemID
GO

--Service Charge TOTAL amount
SELECT 
    p.amount + pm.serviceCharge AS FinalAmount
FROM pay.payment p
JOIN pay.paymentMethod pm
ON p.paymentMethodID = pm.paymentMethodID
GO


--==============  ROLLUP, CUBE, GROUPING SETS   ============--

--ROLLUP

SELECT 
    c.categoryName,
    SUM(i.price) AS TotalPrice
FROM menuItem i
JOIN menuCategory c
ON i.categoryID = c.categoryID
GROUP BY ROLLUP (c.categoryName)
GO

--CUBE


SELECT 
    c.categoryName,
    i.itemName,
    SUM(i.price) AS TotalPrice
FROM menuItem i
JOIN menuCategory c
ON i.categoryID = c.categoryID
GROUP BY CUBE (c.categoryName, i.itemName)
GO

--GROUPING SETS

SELECT 
    c.categoryName,
    i.itemName,
    SUM(i.price) AS TotalPrice
FROM menuItem i
JOIN menuCategory c
ON i.categoryID = c.categoryID
GROUP BY GROUPING SETS
(
    (c.categoryName),
    (i.itemName),
    ()
)
GO

--==============  LOGICAL(AND OR NOT)  ============--
--AND
SELECT *
FROM orderMaster
WHERE orderStatus = 'Pending'
AND tableID = 1
GO

--OR
SELECT *
FROM orderMaster
WHERE orderStatus = 'Pending'
OR orderStatus = 'Preparing'
GO

--OT
SELECT *
FROM menuItem
WHERE NOT categoryID = 2
GO

--==============  COMPARISON,  BETWEEN OPERATOR  ============--

--Comparison Operators
SELECT *
FROM menuItem
WHERE price >= 300
GO

--BETWEEN
SELECT *
FROM menuItem
WHERE price BETWEEN 200 AND 500

--==============  RANGE OF SELECTED ROWS (OFFSET FETCH) ============--
--Pagination (page-wise data)
SELECT *
FROM menuItem
ORDER BY price DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY
GO

--Next page
SELECT *
FROM menuItem
ORDER BY price DESC
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY
GO

--==============  COMPOUND JOIN (Multiple table join) ============--

SELECT 
    o.orderID,
    r.tableNumber,
    i.itemName,
    od.quantity
FROM orderMaster o
JOIN restaurantTable r ON o.tableID = r.tableID
JOIN orderDetails od ON o.orderID = od.orderID
JOIN menuItem i ON od.itemID = i.itemID


--==============  UNION, UNION ALL, EXCEPT, INTERSECT ============--

--UNION 
SELECT orderID FROM pay.payment
UNION
SELECT orderID FROM orderMaster
GO
-- UNION ALL 
SELECT orderID FROM pay.payment
UNION ALL
SELECT orderID FROM orderMaster
GO
--EXCEPT 
SELECT orderID FROM orderMaster
EXCEPT
SELECT orderID FROM pay.payment
GO
-- INTERSECT
SELECT orderID FROM orderMaster
INTERSECT
SELECT orderID FROM pay.payment
GO


--==============  SUBQUERIES ============--
--Subquery in WHERE
SELECT *
FROM menuItem
WHERE categoryID IN
(
    SELECT categoryID
    FROM menuCategory
    WHERE categoryName = 'Drinks'
)
GO
--Subquery with aggregate
SELECT *
FROM menuItem
WHERE price >
(
    SELECT AVG(price)
    FROM menuItem
)
GO
--==============  CTE & RECURSIVE CTE ============--

--Simple CTE
WITH OrderSummary AS
(
    SELECT orderID, COUNT(*) AS TotalItems
    FROM orderDetails
    GROUP BY orderID
)
SELECT *
FROM OrderSummary
GO
--Recursive CTE (number series example)
WITH Numbers AS
(
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM Numbers
    WHERE num < 5
)
SELECT *
FROM Numbers

GO
--==============  MERGE (INSERT / UPDATE) ============--

MERGE pay.payment AS target
USING
(
    SELECT 1 AS orderID, 500 AS amount, 1 AS paymentMethodID
) AS source
ON target.orderID = source.orderID

WHEN MATCHED THEN
    UPDATE SET amount = source.amount

WHEN NOT MATCHED THEN
    INSERT (orderID, amount, paymentMethodID)
    VALUES (source.orderID, source.amount, source.paymentMethodID);
	GO

--==============  CAST, CONVERT, TRY_CONVERT ============--

--CAST
SELECT CAST(price AS INT) AS PriceInt
FROM menuItem
GO
--CONVERT
SELECT CONVERT(VARCHAR, orderTime, 103) AS OrderDate
FROM orderMaster
GO
--TRY_CONVERT
SELECT TRY_CONVERT(INT, 'ABC') AS Result

--==============  OTHER DATA CONVERSION FUNCTIONS ============--

--STR (number → string)
SELECT STR(price, 10, 2) AS PriceText
FROM menuItem
GO

--FORMAT
SELECT FORMAT(orderTime, 'dd-MM-yyyy') AS OrderDate
FROM orderMaster
GO

--==============  NUMERIC FUNCTIONS ============--

--ROUND
SELECT ROUND(price, 0) AS RoundedPrice
FROM menuItem
GO

--CEILING / FLOOR
SELECT CEILING(price) AS CeilPrice, FLOOR(price) AS FloorPrice
FROM menuItem
GO

-- ABS
SELECT ABS(-50) AS AbsoluteValue
GO

--==============  DATE FUNCTIONS ============--

--GETDATE
SELECT GETDATE() AS CurrentDateTime
GO

--DATEDIFF
SELECT 
    orderID,
    DATEDIFF(MINUTE, orderTime, estimatedReadyTime) AS ReadyMinutes
FROM orderMaster
GO

--DATEADD
SELECT DATEADD(MINUTE, 30, orderTime) AS NewReadyTime
FROM orderMaster
GO

--==============  COALESCE, ISNULL, CASE ============--

--COALESCE
SELECT COALESCE(email, phone, 'No Contact') AS ContactInfo
FROM customer
GO

--ISNULL
SELECT ISNULL(orderStatus, 'Pending') AS OrderStatus
FROM orderMaster
GO

--CASE
SELECT 
    orderID,
    CASE 
        WHEN orderStatus = 'Pending' THEN 'Waiting'
        WHEN orderStatus = 'Preparing' THEN 'In Kitchen'
        ELSE 'Completed'
    END AS OrderState
FROM orderMaster
GO

--============== IIF, CHOOSE ============--

--IIF
SELECT 
    itemName,
    IIF(price > 500, 'Expensive', 'Normal') AS PriceLevel
FROM menuItem
GO

--CHOOSE
SELECT 
    orderID,
    CHOOSE(1, 'Pending', 'Preparing', 'Ready', 'Served') AS StatusText
FROM orderMaster
GO

--==============  TEMPORARY TABLES & TABLE VARIABLES============---

--Temporary Table
CREATE TABLE #TempOrders
(
    orderID INT,
    orderStatus VARCHAR(30)
)
GO

INSERT INTO #TempOrders
SELECT orderID, orderStatus
FROM orderMaster
GO

SELECT *
FROM #TempOrders
GO

--able Variable
DECLARE @OrderTable TABLE
(
    orderID INT,
    orderTime DATETIME
)

INSERT INTO @OrderTable
SELECT orderID, orderTime
FROM orderMaster

SELECT *
FROM @OrderTable
GO

--==============  TRANKING FUNCTIONS============--

--ROW_NUMBER
SELECT 
    itemName,
    price,
    ROW_NUMBER() OVER (ORDER BY price DESC) AS RowNum
FROM menuItem
GO

--RANK
SELECT 
    itemName,
    price,
    RANK() OVER (ORDER BY price DESC) AS PriceRank
FROM menuItem
GO

--DENSE_RANK
SELECT 
    itemName,
    price,
    DENSE_RANK() OVER (ORDER BY price DESC) AS DenseRank
FROM menuItem
GO


--==============  ANALYTIC FUNCTIONS (WINDOW FUNCTIONS)============--

--LEAD()

SELECT 
    itemName,
    price,
    LEAD(price) OVER (ORDER BY price) AS NextItemPrice
FROM menuItem
GO


-- LAG()

SELECT 
    itemName,
    price,
    LAG(price) OVER (ORDER BY price) AS PreviousItemPrice
FROM menuItem
GO

--FIRST_VALUE()

SELECT 
    categoryID,
    itemName,
    price,
    FIRST_VALUE(itemName) 
        OVER (PARTITION BY categoryID ORDER BY price) AS CheapestItem
FROM menuItem
GO

--LAST_VALUE()
SELECT 
    categoryID,
    itemName,
    price,
    LAST_VALUE(itemName) 
        OVER (
            PARTITION BY categoryID 
            ORDER BY price
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS MostExpensiveItem
FROM menuItem
GO

-- CUME_DIST()

SELECT 
    itemName,
    price,
    CUME_DIST() OVER (ORDER BY price) AS CumulativeDistribution
FROM menuItem
GO



-- PERCENT_RANK()

SELECT 
    itemName,
    price,
    PERCENT_RANK() OVER (ORDER BY price) AS PercentRank
FROM menuItem
GO

--NTILE()

SELECT 
    itemName,
    price,
    NTILE(4) OVER (ORDER BY price) AS PriceGroup
FROM menuItem
GO

--==============  SYSTEM STORED PROCEDURES============--

--List all databases
EXEC sp_databases
GO

--Table structure
EXEC sp_help 'orderMaster'
GO

--All stored procedures
EXEC sp_stored_procedures
GO


--==============  TRANSACTIONS WITH SAVEPOINTS============--

BEGIN TRANSACTION
GO

INSERT INTO menuCategory (categoryName)
VALUES ('Dessert')
GO

SAVE TRANSACTION SavePoint1
GO

INSERT INTO menuCategory (categoryName)
VALUES ('InvalidCategory')
GO

ROLLBACK TRANSACTION SavePoint1
GO

COMMIT TRANSACTION
GO
--RANSACTIONS

BEGIN TRANSACTION
GO

INSERT INTO restaurantTable (tableNumber, tableStatus)
VALUES (10, 'Available')
GO

INSERT INTO restaurantTable (tableNumber, tableStatus)
VALUES (11, 'Available')
GO

COMMIT TRANSACTION
GO

--==============  LOCKING & LOCK MODES (SQL Server)============--

--Shared Lock (S) – SELECT
SELECT *
FROM orderMaster WITH (HOLDLOCK)
GO

--Exclusive Lock (X) – INSERT / UPDATE
UPDATE orderMaster
SET orderStatus = 'Preparing'
WHERE orderID = 1
GO

--Update Lock (U)
SELECT *
FROM orderMaster WITH (UPDLOCK)
WHERE orderID = 1
GO

--==============  TDEADLOCK PREVENTION===========---

--Method 1: Same order of table access
BEGIN TRANSACTION
GO

UPDATE orderMaster
SET orderStatus = 'Ready'
WHERE orderID = 1

UPDATE pay.payment
SET amount = amount + 50
WHERE orderID = 1

COMMIT TRANSACTION
GO

--Method 2: SET DEADLOCK_PRIORITY
SET DEADLOCK_PRIORITY LOW
GO


--==============  APPLICATION ROLES============--

--Create Application Role
CREATE APPLICATION ROLE appOrderRole
WITH PASSWORD = 'App@123'
GO

--Activate Role
EXEC sp_setapprole 'appOrderRole', 'App@123'
GO

--==============  COLLATIONS ============--
--Database collation check
SELECT DATABASEPROPERTYEX(DB_NAME(), 'Collation') AS DbCollation
GO
--Column level collation
SELECT *
FROM customer
WHERE customerName COLLATE Latin1_General_CS_AS = 'nishi'
GO
--==============  CODE SCRIPTS (Example Script Block)============--

BEGIN TRANSACTION
GO

INSERT INTO menuCategory (categoryName)
VALUES ('Beverages')
GO

COMMIT TRANSACTION
GO

--==============  TRY–CATCH BLOCK (ERROR HANDLING)============--

BEGIN TRY
    INSERT INTO menuItem (itemName, categoryID, price)
    VALUES ('Test Item', 1, -100)
END TRY

BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage
END CATCH
GO

--==============  CURSOR IN SQL SERVER============--

DECLARE @itemName VARCHAR(100)
DECLARE @price MONEY

DECLARE itemCursor CURSOR
FOR
SELECT itemName, price
FROM menuItem
GO

OPEN itemCursor
GO

FETCH NEXT FROM itemCursor INTO @itemName, @price
GO

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @itemName + ' - ' + CAST(@price AS VARCHAR)

    FETCH NEXT FROM itemCursor INTO @itemName, @price
END
GO

CLOSE itemCursor
GO
DEALLOCATE itemCursor
GO

/*
==============================  SECTION 08  ==============================
								DECLARE VARIABLES	
==========================================================================
*/


-- -------------------SCALAR Variable  ------------------- --

DECLARE @orderID INT
SET @orderID = 101

SELECT *
FROM orderMaster
WHERE orderID = @orderID
GO

-- ------------------- TABLE  Variable  ------------------- --

DECLARE @OrderTable TABLE
(
    orderID INT,
    orderStatus VARCHAR(30),
    orderTime DATETIME
)

INSERT INTO @OrderTable
SELECT orderID, orderStatus, orderTime
FROM orderMaster

SELECT *
FROM @OrderTable
GO

-- ------------------- TEMPORARY TABLE  ------------------- --

CREATE TABLE #TempOrders
(
    orderID INT,
    tableID INT,
    orderStatus VARCHAR(30)
)

INSERT INTO #TempOrders
SELECT orderID, tableID, orderStatus
FROM orderMaster
WHERE orderStatus = 'Pending'

SELECT *
FROM #TempOrders
GO

-- ------------------- LOCAL VARIABLE   ------------------- --

DECLARE @LocalVar INT
SET @LocalVar = 500

PRINT 'Local Variable Value: ' + CAST(@LocalVar AS VARCHAR)
GO

-- ------------------- GLOBAL VARIABLE  ------------------- --

SELECT @@VERSION AS SQLServerVersion
SELECT @@TRANCOUNT AS ActiveTransactionCount
SELECT @@IDENTITY AS LastInsertedIdentity

-- ------------------- SYSTEM VARIABLE   ------------------- --

SELECT GETDATE() AS CurrentDateTime
SELECT SUSER_NAME() AS CurrentUser
SELECT DB_NAME() AS CurrentDatabase

-- [========= Query Using All Literal Types =========]

SELECT *
FROM orderMaster
WHERE orderTime >= '2025-12-30 10:00:00'
GO

SELECT *
FROM orderMaster
WHERE orderTime = CAST('2025-12-30' AS DATETIME)
GO


                         --======================================================================
                                    -->>>>>>>>>>>>>>> END OF THE DML <<<<<<<<<<<<<<
                          --========================================================================

