# 🍽️ Smart Restaurant Ordering Management System (SROMS)

> A relational database-driven system built with **Microsoft SQL Server** to automate and manage restaurant operations — covering table management, menu categorization, order processing, and payment tracking.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Database Schema](#database-schema)
- [Project Structure](#project-structure)
- [Database Objects](#database-objects)
- [Getting Started](#getting-started)
- [Sample Data](#sample-data)
- [Limitations](#limitations)
- [Future Recommendations](#future-recommendations)
- [Author](#author)

---

## Overview

Traditional restaurant systems suffer from manual order-taking errors, poor payment tracking, and lack of data consistency. **SROMS** replaces these manual processes with a structured, secure, and optimized SQL Server database solution that enforces data integrity through constraints, views, stored procedures, functions, and triggers.

---

## Features

- ✅ Dining table status management (Available / Occupied / Reserved)
- ✅ Menu category and menu item management with price validation
- ✅ Customer registration and tracking
- ✅ Order processing (master + detail records)
- ✅ Kitchen activity logging via triggers
- ✅ Flexible payment method support (cash & digital)
- ✅ Automated audit trail on every order status change
- ✅ Role-based database access control

---

## Database Schema

The system uses **8 core tables** across two schemas (`dbo` and `pay`):

| Table | Schema | Description |
|---|---|---|
| `restaurantTable` | dbo | Dining tables and their availability status |
| `menuCategory` | dbo | Categories grouping menu items |
| `menuItem` | dbo | Individual dishes with price |
| `orderMaster` | dbo | Order header — table, time, status |
| `orderDetails` | dbo | Line items for each order |
| `kitchenActivityLog` | dbo | Audit log for order status changes |
| `customer` | dbo | Customer contact information |
| `paymentMethod` | pay | Payment methods (cash, bKash, card, etc.) |
| `payment` | pay | Payment transactions linked to orders |

### Entity Relationships

```
menuCategory ──< menuItem ──< orderDetails >── orderMaster >── restaurantTable
                                                   │
                                               payment >── paymentMethod
                                               kitchenActivityLog
```

---

## Project Structure

```
SROMS/
├── DDL_1293992.sql     # Schema, tables, views, procedures, functions, triggers
└── DML_1293992.sql     # Data insertion, queries, transactions, cursors
```

---

## Database Objects

### 🗂️ Views

| View | Description |
|---|---|
| `vw_customer` | Simple customer listing |
| `vw_OrderDetails` | Orders joined with items and quantities |
| `pay.vPaymentDetails` | Payment records with method info |
| `pay.vTotalPaymentByMethod` | Aggregated totals per payment method |
| `pay.vOrderPaymentInfo` | Orders joined with payment records |
| `pay.vEncryptedPayment` | Encrypted view of payment data |
| `pay.SchemaBoundPayment` | Schema-bound view for indexed views |

### ⚙️ Stored Procedures

| Procedure | Description |
|---|---|
| `pay.spInsertPayment` | Insert a new payment record |
| `pay.spUpdatePaymentStatus` | Update payment amount by ID |
| `pay.spDeletePayment` | Delete a payment record |
| `pay.spGetPaymentDetails` | Retrieve payment info by ID |
| `pay.spTotalPaymentByUser` | Return total payment amount (OUTPUT param) |
| `pay.spCheckPaymentExist` | Check existence via RETURN value |

### 🔢 User-Defined Functions

| Function | Type | Description |
|---|---|---|
| `pay.fnTotalPaymentAmount` | Scalar | Returns sum of payments for a given ID |
| `pay.fnGetAllPaymentMethods` | Inline Table-Valued | Returns all digital payment methods |

### ⚡ Triggers

| Trigger | Type | Fires On | Description |
|---|---|---|---|
| `trg_AfterInsert_OrderMaster` | AFTER INSERT | `orderMaster` | Logs new order creation |
| `trg_AfterUpdate_OrderStatus` | AFTER UPDATE | `orderMaster` | Logs status changes (before/after) |
| `trg_AfterDelete_Order` | AFTER DELETE | `orderMaster` | Logs order deletion |
| `trg_InsteadInsert_MenuItem` | INSTEAD OF INSERT | `menuItem` | Validates price > 0 before insert |
| `trg_InsteadDelete_PaymentMethod` | INSTEAD OF DELETE | `pay.paymentMethod` | Blocks deletion of in-use payment methods |
| `trg_InsteadInsert_vw_OrderDetails` | INSTEAD OF INSERT | `vw_OrderDetails` | Redirects insert through view to base table |
| `trg_InsteadUpdate_vw_OrderDetails` | INSTEAD OF UPDATE | `vw_OrderDetails` | Redirects update through view to base table |
| `trg_InsteadDelete_vw_OrderDetails` | INSTEAD OF DELETE | `vw_OrderDetails` | Redirects delete through view to base table |

### 📇 Indexes

| Index | Type | Table | Column |
|---|---|---|---|
| `ixcustomerID` | Clustered | `customer` | `customerID` |
| `IX_MenuItem_Price` | Non-Clustered | `menuItem` | `price` |
| `ixcustomerphn` | Unique | `customer` | `phone` |

---

## Getting Started

### Prerequisites

- Microsoft SQL Server 2019 or later
- SQL Server Management Studio (SSMS)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/SROMS.git
   cd SROMS
   ```

2. **Run the DDL script** to create the database, schema, tables, and all objects:
   ```sql
   -- Open DDL_1293992.sql in SSMS and execute
   ```

3. **Run the DML script** to populate sample data and test queries:
   ```sql
   -- Open DML_1293992.sql in SSMS and execute
   ```

> ⚠️ The DDL script will **drop and recreate** the `SROMS` database if it already exists. Back up any existing data before running.

### Database Credentials (Development Only)

```
Login    : SROMS_Login
Password : P@ssw0rd123
User     : SROMS_User
Permissions: SELECT, INSERT, UPDATE
```

---

## Sample Data

The DML file seeds the database with realistic sample data including:

- **15** dining tables
- **14** menu categories (Popular, Set Menu, Pizza, Kabab & Grill, Drinks, etc.)
- **50+** menu items with prices
- **22** customer records
- Order records, payment methods, and transaction history

---

## Limitations

- No graphical user interface (GUI) — database layer only
- Manual data entry required
- No real-time mobile or web integration
- No online delivery support

---

## Future Recommendations

- 🌐 Develop a web or mobile front-end application
- 🔐 Add role-based user access control
- 💳 Integrate online payment gateways (bKash, Nagad, Stripe)
- 📡 Implement real-time order tracking and kitchen display system

---

## Author

**Najmun Naher**  
Trainee ID: `1293992` | Batch: `WADA/PNTL-M/69/01`  
IsDB-BISEW IT Scholarship Programme — Module 02: SQL Server  

Submitted to: **Syed Zahidul Hassan**, Consultant, Show & Tell Consulting Ltd  
Submission Date: 3rd January 2026

---

*Built with ❤️ using Microsoft SQL Server*
