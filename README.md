# 🏦 Bank Transaction Analysis System (SQL)

A SQL Server project that simulates a real-world banking transaction system by importing, cleaning, transforming, and analyzing transaction data. This project demonstrates advanced SQL concepts including data loading, data type conversion, functions, aggregate queries, and transaction analysis.

---

## 📌 Project Overview

The **Bank Transaction Analysis System** is designed to process banking transaction records from a CSV dataset into a structured SQL database. The project focuses on data preprocessing and analysis to generate meaningful insights that can help financial institutions monitor customer transactions and improve decision-making.

---

## 🚀 Features

* Import transaction data using **BULK INSERT**
* Create and manage database tables
* Perform data type conversions
* Clean and transform raw data
* Execute analytical SQL queries
* Calculate account balances and transaction summaries
* Use SQL aggregate functions
* Demonstrate SQL Server database operations

---

## 🛠 Technologies Used

* Microsoft SQL Server
* SQL (DDL, DML, DQL)
* BULK INSERT
* Aggregate Functions
* Data Type Conversion
* SQL Server Management Studio (SSMS)

---

## 📂 Project Structure

```
Bank-Transaction-Analysis/
│
├── SQL PROJECT1(BANKTANS).sql
├── bank_transactions_data_2.csv
├── README.md
```

---

## 🗄 Database Schema

The project stores the following information:

* Transaction ID
* Account ID
* Transaction Amount
* Transaction Date
* Transaction Type
* Location
* Device ID
* IP Address
* Merchant ID
* Transaction Channel
* Customer Age
* Customer Occupation
* Transaction Duration
* Login Attempts
* Account Balance
* Previous Transaction Date

---

## 📊 SQL Concepts Demonstrated

* CREATE TABLE
* ALTER TABLE
* BULK INSERT
* INSERT INTO...SELECT
* CAST()
* Aggregate Functions (`SUM`, `COUNT`, `AVG`)
* GROUP BY
* Scalar Functions
* Data Cleaning
* Data Transformation

---

## ▶️ How to Run

1. Clone this repository.
2. Open **SQL Server Management Studio (SSMS)**.
3. Create a new database.
4. Update the CSV file path in the `BULK INSERT` statement.
5. Execute the SQL script.
6. Run the analysis queries to view the results.

---

## 📈 Sample Analysis

This project can be extended to answer questions such as:

* Total number of transactions
* Total transaction amount
* Average account balance
* Highest and lowest transaction values
* Transactions by location
* Transactions by channel
* Customer age distribution
* Merchant-wise transaction analysis
* Daily and monthly transaction trends

---

## 🎯 Learning Outcomes

Through this project, I gained practical experience in:

* Designing relational database tables
* Importing external datasets into SQL Server
* Cleaning and transforming raw data
* Writing efficient SQL queries
* Performing banking transaction analysis
* Working with real-world datasets

---

## 📌 Future Enhancements

* Add stored procedures
* Implement views for reporting
* Create triggers for auditing
* Add indexes for performance optimization
* Build interactive dashboards using Power BI
* Detect suspicious or fraudulent transactions

---

## 👨‍💻 Author

**Tejasvi Parate**

If you found this project helpful, feel free to ⭐ the repository and connect with me on GitHub.
