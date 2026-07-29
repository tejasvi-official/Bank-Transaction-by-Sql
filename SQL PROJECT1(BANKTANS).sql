--Bulk Insert Data in Master Data Base System
select * from dbo.bankTransactions_Stage;
---Created table 
CREATE TABLE BankTransactions_Stage
(
TransactionID VARCHAR(50),
AccountID VARCHAR(50),
TransactionAmount VARCHAR(50),
TransactionDate VARCHAR(50),
TransactionType VARCHAR(50),
Location VARCHAR(50),
DeviceID VARCHAR(50),
IPAddress VARCHAR(50),
MerchantID VARCHAR(50),
Channel VARCHAR(50),
CustomerAge VARCHAR(50),
CustomerOccupation VARCHAR(100),
TransactionDuration VARCHAR(50),
LoginAttempts VARCHAR(50),
AccountBalance VARCHAR(50),
PreviousTransactionDate VARCHAR(50)
);
---Bulk insert data 
BULK INSERT BankTransactions_Stage
FROM 'C:\Users\HP\Downloads\bank_transactions_data_2.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  -- Change if your CSV uses semicolons or tabs
    ROWTERMINATOR = '0x0a'  -- '0x0a' is a common fix for modern CSV line endings
);
---Alter table
ALTER TABLE BankTransactions
ALTER COLUMN Location VARCHAR(100);

ALTER TABLE BankTransactions
ALTER COLUMN IPAddress VARCHAR(50);

ALTER TABLE BankTransactions
ALTER COLUMN MerchantID VARCHAR(50);

ALTER TABLE BankTransactions
ALTER COLUMN Channel VARCHAR(50);

ALTER TABLE BankTransactions
ALTER COLUMN CustomerOccupation VARCHAR(100);

--Function to insert Bulk Data Set
INSERT INTO BankTransactions
SELECT
TransactionID,
AccountID,
CAST(TransactionAmount AS FLOAT),
CAST(TransactionDate AS DATETIME),
TransactionType,
Location,
DeviceID,
IPAddress,
MerchantID,
Channel,
CAST(CustomerAge AS INT),
CustomerOccupation,
CAST(TransactionDuration AS INT),
CAST(LoginAttempts AS INT),
CAST(AccountBalance AS FLOAT),
CAST(PreviousTransactionDate AS DATETIME)
FROM BankTransactions_Stage;

select*from dbo.bankTransactions

-------------------------------------------------------------------------------------------------------------------------------------------

--SCALAR FUNCTION
SELECT TransactionID, sum(AccountBalance) AS SUMBalance FROM bankTransactions GROUP BY TransactionID;
SELECT TransactionID, AVG(AccountBalance) AS AvgBalance FROM bankTransactions GROUP BY TransactionID;
SELECT TransactionID, COUNT(*) AS couBalance FROM bankTransactions GROUP BY TransactionID;
SELECT TransactionID, MAX(AccountBalance) AS HighestBalance FROM bankTransactions GROUP BY TransactionID;
SELECT TransactionID, MIN(AccountBalance) AS LowestBalance FROM bankTransactions GROUP BY TransactionID;
--------------------------------------------------------------------------------------------------------------------------------------------------

-- Rank[skips rank numbers when there are duplicate values.]
SELECT 
    TransactionID,
    AccountID,
    TransactionAmount,
    RANK() OVER (ORDER BY TransactionAmount DESC) AS Transaction_Rank
FROM bankTransactions;

-- Dense Rank[does not skip rank numbers when there are duplicate values.]
SELECT 
    TransactionID,
    AccountID,
    TransactionAmount,
    DENSE_RANK() OVER (ORDER BY TransactionAmount DESC) AS Dense_Rank
FROM bankTransactions;

--ROW NUMBER
SELECT TransactionID, ROW_NUMBER() OVER (ORDER BY AccountBalance DESC) AS RowNum FROM bankTransactions;
select*from bankTransactions
-------------------------------------------------------------------------------------------------------------------------------------------------

--LEAD [NEXT VALUE]
SELECT TransactionID, TransactionAmount, LEAD(TransactionAmount, 1, 0) OVER (ORDER BY TransactionDuration) AS NextAmount FROM bankTransactions;
select*from bankTransactions

--LAD [PREVIOUS VALUE]
SELECT TransactionID, TransactionAmount, LAG(TransactionAmount, 1, 0) OVER (ORDER BY TransactionDuration) AS PreviousSalary FROM bankTransactions;


--getdate function
SELECT GETDATE() AS CurrentDate;

SELECT
    UPPER(CustomerOccupation) AS Occupation
FROM
    bankTransactions;

    --These functions operate on a single input value and return a single output value.

    --lower function
     SELECT LOWER(Location) AS loc FROM bankTransactions;

     --upper functon
     SELECT UPPER(Location) AS loc FROM bankTransactions;

     --LEN FUN
     SELECT Location , LEN(Location) AS Length FROM bankTransactions;

     --db_name(given current working database name)
     SELECT DB_NAME() AS ActiveDatabase;


select*from dbo.bankTransactions

--Table-Valued Functions(A Table-Valued Function (TVF) returns a table instead of a single value.)
CREATE FUNCTION AccountBalance()
RETURNS TABLE
AS
RETURN
(
    SELECT TransactionID, AccountBalance
    FROM bankTransactions
    WHERE AccountBalance > 6000
);
SELECT * FROM AccountBalance();
-----------------------------------------------------------------------------------------------------------------

--aggreagte fun
SELECT
SUM(AccountBalance) AS Totalbalance,
AVG(AccountBalance) AS Averagebalance,
MAX(AccountBalance) AS Highestbalance,
MIN(AccountBalance) AS Lowestbalance
FROM bankTransactions;

select*from bankTransactions

--substring
SELECT SUBSTRING(transactiontype,1,4)
FROM bankTransactions;

SELECT  DATEADD(DAY,20,GETDATE()) as dATEAFTER1MONTH;

--Difference between dates:
SELECT DATEDIFF(HOUR, TransactionDate, GETDATE()) AS DATETIME
FROM bankTransactions;
select*from bankTransactions

SELECT DB_NAME() AS ActiveDatabase;

---------------------------------------------------------------------------------------------------------------

-- SUBQUERY :- A Subquery is a query inside another query.--
--Q Find Transactiontype whose TA is greater than the average TA.
--(for mean)--
SELECT Transactiontype, TransactionAmount
FROM bankTransactions
WHERE TransactionAmount >
      (SELECT avg(TransactionAmount) FROM bankTransactions);
      select*from bankTransactions

SELECT AccountID, avg(TransactionAmount) AS TransactionAmount FROM bankTransactions GROUP BY AccountID;

--(for subquery max)--
SELECT Transactiontype, TransactionAmount
FROM bankTransactions
WHERE TransactionAmount =
      (SELECT max(TransactionAmount) FROM bankTransactions);
      --(for max only)

 

--(for subquery min)--
SELECT Transactiontype, TransactionAmount
FROM bankTransactions
WHERE TransactionAmount =
      (SELECT min(TransactionAmount) FROM bankTransactions);
      --(for only min)
select Transactiontype, min(TransactionAmount) as TransactionAmount from bankTransactions group by Transactiontype
  
  --(for subquery sum)--
  SELECT Transactiontype, TransactionAmount
FROM bankTransactions
WHERE TransactionAmount <=
      (SELECT sum(TransactionAmount) FROM bankTransactions);
      --(for only sum)
select Transactiontype, sum(TransactionAmount) as TransactionAmount from bankTransactions group by Transactiontype
--------------------------------------------------------------------------------------------------------------------

--CORELATED SUBQUERY

SELECT AccountId, AccountBalance, TransactionID
FROM bankTransactions e1
WHERE  AccountBalance >
(
    SELECT AVG(AccountBalance)
    FROM bankTransactions e2
    WHERE e1.TransactionID = e2.TransactionID
);
SELECT*FROM bankTransactions
-------------------------------------------------------------------------------------------
----EXITS-------
SELECT Transactiontype, CustomerOccupation
FROM bankTransactions e
WHERE EXISTS
(
    SELECT *
    FROM bankTransactions d
    WHERE e.TransactionAmount = d.TransactionAmount
);

  ----------------------------------------------------------------------------------------

--dimension table--
CREATE TABLE DimAccount (
    AccountID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Branch VARCHAR(50)
);
ALTER TABLE BankTransactions
ADD CONSTRAINT FK_Account
FOREIGN KEY (AccountID)
REFERENCES DimAccount(AccountID);

-------------------------------------------------------------------------------------------

CREATE PROCEDURE Get_bank_transactions
AS
BEGIN
    select*from bankTransactions
END;
exec sp_helptext Get_bank_transactions
exec  Get_bank_transactions
-------------------------------------------------------------------------------

drop table bank_transactions_2
select*from bank_transactions_data_2


















