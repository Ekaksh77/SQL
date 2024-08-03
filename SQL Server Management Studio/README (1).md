# SQL Learning Repository

## Table of Contents
1. [DDL (Data Definition Language)](#ddl)
2. [DML (Data Manipulation Language)](#dml)
3. [SQL Clauses](#sql-clauses)
4. [SQL Examples](#sql-examples)
5. [Update Function](#update-function)
6. [Assignments](#assignments)
7. [Advanced SQL Queries](#advanced-sql-queries)
8. [SQL Functions](#sql-functions)
9. [Subqueries](#subqueries)
10. [Temporary Tables](#temporary-tables)
11. [Joins](#joins)
12. [Self Joins and Unions](#self-joins-and-unions)
13. [Stored Procedures](#stored-procedures)
14. [Running Totals](#running-totals)
15. [Ranking Functions](#ranking-functions)

---

## DDL (Data Definition Language)

- **Use**: Create table, define its columns, drop table, truncate table, alter table.
- **Commands**:
  - `CREATE TABLE`
  - `DROP TABLE`
  - `TRUNCATE TABLE`
  - `ALTER TABLE`

---

## DML (Data Manipulation Language)

- **Use**: Insert values into the table.
- **Commands**:
  - `INSERT INTO`

---

## SQL Clauses

- **CHAR**: Fixed length character data type.
- **VARCHAR**: Variable length character data type.

### Basic SQL Clauses
- **SELECT**: What exact data you are looking for.
- **FROM**: Which table you want to search.
- **WHERE**: Used as a filter.
- **GROUP BY**
- **HAVING**
- **ORDER BY**

---

## SQL Examples

1. **Create Table**
    ```sql
    CREATE TABLE employee (
        EMP_Name VARCHAR(100),
        Department VARCHAR(50),
        Salary INT
    );
    ```

2. **Insert Values**
    ```sql
    INSERT INTO employee (EMP_Name, Department, Salary)
    VALUES 
        ('Shyam', 'Analytics', 5000),
        ('John', 'Ops', 2000),
        ('Max', 'Sales', 6500);
    ```

3. **Select All Columns**
    ```sql
    SELECT * FROM employee;
    ```

4. **Select Specific Columns**
    ```sql
    SELECT EMP_Name, Salary FROM employee;
    ```

5. **Filter Rows**
    ```sql
    SELECT * FROM employee WHERE Department = 'Ops';
    ```

6. **Comparison Filters**
    ```sql
    SELECT * FROM employee WHERE Salary > 2000;
    SELECT * FROM employee WHERE Salary <= 2000;
    ```

---

## Update Function

- **Use**: Update the current data.

1. **Update Employee Name**
    ```sql
    UPDATE employee
    SET EMP_Name = 'Muller'
    WHERE EMP_Name = 'Max';
    ```

2. **Update Salary**
    ```sql
    UPDATE employee
    SET Salary = 10000
    WHERE Salary = 5000;
    ```

---

## Assignments

### Assignment 1
1. Get all details from the table for employees from the California state.
2. Get all profit data from the table for the Texas state.
3. Get all product data from the California state.
4. Get all sales from the table where the amount is more than 2000.

### Assignment 2
1. Find Order Date, Customer Name, Sales, and profit for customers where sales are greater than 2000.
2. Find Customer, Product Name, Sales, and profit where sales are more than 3000 and profit is more than 0.
3. Find Customer names where the name starts with 'A'.
4. How to assign alias names to columns.
5. Find customers from Texas state with their sales and show Business Instead sales column.
6. How to use OR and AND operators.
7. Find Segment-wise Sales for customers from California state where sales are greater than 2000 and profit is greater than 50.
8. Find Customer, state, region, and product details for customers who purchased apple products.
9. How to find unique names.
10. View total Order ID and unique Order ID.
11. Count the different types of ship modes.
12. Count the different types of sub-categories.
13. Find sub-categories with sales between 2000 and 3000.
14. View category, sub-category, ship mode-wise quantity, and sales for customers where quantity is more than 3.
15. Show total sales using the SUM function.
16. Calculate total sales, total profit, total quantity, and total discount.
17. Count total number of Order IDs.

### Assignment 3
1. Count unique customers.
2. Count unique order IDs.
3. Calculate total sales, total customers, and total products.
4. Calculate total sales, total profit, and total quantity for the California state.
5. Find category-wise sales where sales are more than 3000 or profit is more than 2000.
6. Calculate total number of cities and count of unique cities.

### Assignment 4
1. Find sales and profit for sub-categories: Supplies, Storage, or Phones.
2. Find sub-category-wise sales and profit for customers where the sub-category is Storage or Chairs, with sales greater than 100 and profit greater than 9.
3. Calculate ship mode-wise total sales, total profit, and total quantity.
4. Count customers by city and region for customers where sub-categories are Supplies, Phones, or Chairs.
5. Find category-wise sales for Furniture and Office Supplies where sales are greater than 500, profit is greater than 100, and quantity is more than 1.
6. Calculate total sales and profit by city where total sales are greater than 50000.
7. Find product IDs of products where the product name appears more than once.

---

## Advanced SQL Queries

### Class 2 Queries
1. Find Order Date, Customer Name, Sales, and profit for customers where sales are greater than 2000.
2. Find Customer, Product Name, Sales, and profit where sales are more than 3000 and profit is more than 0.
3. Find Customer names where the name starts with 'A'.
4. Assign alias names to columns.
5. Find customers from Texas state with their sales and show Business Instead sales column.
6. Use OR and AND operators.
7. Find Segment-wise Sales for customers from California state where sales are greater than 2000 and profit is greater than 50.
8. Find Customer, state, region, and product details for customers who purchased apple products.
9. Find unique names.
10. View total Order ID and unique Order ID.
11. Count the different types of ship modes.
12. Count the different types of sub-categories.
13. Find sub-categories with sales between 2000 and 3000.
14. View category, sub-category, ship mode-wise quantity, and sales for customers where quantity is more than 3.
15. Show total sales using the SUM function.
16. Calculate total sales, total profit, total quantity, and total discount.
17. Count total number of Order IDs.

### Class 3 Queries
1. Find sales and profit for sub-categories: Supplies, Storage, or Phones.
2. Find sub-category-wise sales and profit for customers where the sub-category is Storage or Chairs, with sales greater than 100 and profit greater than 9.
3. Calculate ship mode-wise total sales, total profit, and total quantity.
4. Count customers by city and region for customers where sub-categories are Supplies, Phones, or Chairs.
5. Find category-wise sales for Furniture and Office Supplies where sales are greater than 500, profit is greater than 100, and quantity is more than 1.
6. Calculate total sales and profit by city where total sales are greater than 50000.
7. Find product IDs of products where the product name appears more than once.

### Class 4 Queries
1. Find customer names and their sales where the name starts with 'A' or 'B'.
2. Find category-wise sales excluding Office Supplies.
3. Find category and sub-category-wise total sales and profit where total sales are less than 20000; exclude sub-categories: Supplies, Storage, Phones, Fasteners.
4. Display state names in ascending order excluding California.
5. Show top 10 highest sales with customer name and product.
6. Show top 3 states in terms of total business.
7. Show top 5 highest sales states and their total product count excluding Furniture category.

---

## SQL Functions

### Class 5 Functions
1. **CAST**: Convert data types.
2. **YEAR**: Extract year from a date.
3. **GETDATE**: Get current date and time.
4. **DATEPART**: Extract part of a date.
5. **DATENAME**: Get the name of the date part.
6. **DATEDIFF**: Calculate the difference between two dates.

### Class 5 Queries
1. Calculate the day difference between order date and ship date.
2. Find customer names and discount for orders in the Furniture category with discounts between 10% and 15%.

---

## Subqueries

### Class 6 Queries
1. Find the second highest sales.
2. Find the 5th highest sales.

---

## Temporary Tables

### Class 7 Queries
1. Store values in a temporary table using `INTO`.
2. Calculate sales, profit, and quantity for various ship modes excluding certain classes.
3. Calculate state-wise total sales with specific city conditions.
4. Find the count of customer names containing 'A', 'E', or '
