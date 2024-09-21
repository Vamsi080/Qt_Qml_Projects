# AiraaCorporates Database Setup

This repository contains the SQL scripts required to set up the `AiraaCorporates` database. It includes definitions for the `Employee`, `Expenses`, and `MonthlyExpenses` tables. 

## Table of Contents

- [Introduction](#introduction)
- [Database Creation](#database-creation)
- [Using the Database](#using-the-database)
- [Creating Tables](#creating-tables)
  - [Employee Table](#1-employee-table)
  - [Expenses Table](#2-expenses-table)
  - [MonthlyExpenses Table](#3-monthlyexpenses-table)
- [Setup Summary](#setup-summary)

## Introduction

Before running the application on "LocalHost," you need to set up the database. Follow the instructions below to create the database and its tables.

## Database Creation

To create a new database, use the following SQL query:

```sql
CREATE DATABASE AiraaCorporates;
```
## Using the Database

To select the database for use, execute:

```sql
USE AiraaCorporates;
```
## Creating Tables

# 1. Employee Table

    To create the Employee table, execute the following SQL statement:

```sql
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
```
# 2. Expenses Table

    To create the Expenses table, run the following SQL command:

```sql
CREATE TABLE Expenses (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(50) NOT NULL,
    expense_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
```
# 3. MonthlyExpenses Table

    To create the MonthlyExpenses table, use this SQL query:
```sql
CREATE TABLE MonthlyExpenses (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(50) NOT NULL,
    month_year VARCHAR(7) NOT NULL,
    total_expenses DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
```

## Setup Summary

   # Create the database AiraaCorporates.
   # Use the command USE AiraaCorporates; to select the database.
   # Create the tables using the provided SQL queries.

 
