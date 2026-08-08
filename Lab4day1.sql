create database BankingDB;
use BankingDB;

show databases;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

ALTER TABLE Customers
ADD DateOfBirth DATE;

select * from Customers;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

select * from Customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE AccountBranches;

ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

select * from Accounts ;


ALTER TABLE Customers
ADD CONSTRAINT uq_Customer_CreationDate UNIQUE (AccountCreationDate);


ALTER TABLE Accounts
ADD CONSTRAINT fk_Accounts_Customers_Date
FOREIGN KEY (AccountCreationDate)
REFERENCES Customers (AccountCreationDate);

select * from Transactions;

ALTER TABLE Loans
ADD AccountID INT ;

ALTER TABLE Accounts
ADD constraint KK_Accounts_ID primary key(AccountID);

ALTER TABLE Loans 
ADD CONSTRAINT fk_Loans_Accounts 
FOREIGN KEY (AccountID)
references Accounts(AccountID);

drop table Branches;
select * from branches ;


ALTER TABLE Branches 
ADD CONSTRAINT PK_Branches PRIMARY KEY (BranchID);

ALTER TABLE Loans 
ADD CONSTRAINT fk_Branches_Loans 
FOREIGN KEY (BranchID) 
REFERENCES Branches(BranchID);

ALTER TABLE Branches 
ADD TransactionID INT ;

ALTER TABLE Transactions 
ADD CONSTRAINT PK_Transactions PRIMARY KEY (TransactionID);

ALTER TABLE Branches
ADD CONSTRAINT fk_Transaction_Branches
FOREIGN KEY (TransactionID) 
REFERENCES Transactions(TransactionID);

ALTER TABLE Branches 
ADD CustomerID INT ;

ALTER TABLE Branches 
ADD CONSTRAINT BR_PRIMARY primary key(CustomerID);

ALTER TABLE Branches 
ADD constraint fk_Customer_Branches
foreign key (CustomerID)
references Customers (CustomerID);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

SET SQL_SAFE_UPDATES=0;

update Customers
SET Phone='9999999999'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

DELETE FROM Transactions
WHERE TransactionID = 302;

SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;

SELECT * FROM Customers;

SELECT FirstName, LastName, Email, Phone
FROM Customers;

SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

SELECT *
FROM Accounts
WHERE Balance > 25000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);

SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

SELECT *
FROM Customers
ORDER BY FirstName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

