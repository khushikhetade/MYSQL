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



