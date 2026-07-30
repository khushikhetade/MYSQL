create database BankingDB;
use BankingDB;
CREATE TABLE BankingDB (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Account_Creation_Date DATE
);
select * from BankingDB;
