Creating a Database:
---------------------
1.)To create a new database, use the following query:
    CREATE DATABASE AiraaCorporates;

Using the Database:
-------------------
2.)To select the database for use:
    USE AiraaCorporates;
    
Creating Tables:
-----------------
1. Employee Table:
   ---------------
/*
CREATE TABLE Employee (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(50) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    gender VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
*/

2.Expenses Table:
------------------
/* 
CREATE TABLE Expenses (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(50) NOT NULL,
    expense_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
*/

3.MonthlyExpenses Table:
-----------------------
/*
CREATE TABLE MonthlyExpenses (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(50) NOT NULL,
    month_year VARCHAR(7) NOT NULL,
    total_expenses DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
*/

This document provides all the queries needed to create a database named AiraaCorporates and the corresponding tables: Employee, Expenses, and MonthlyExpenses.

We need to set this Before running the Application in "LocalHost".


