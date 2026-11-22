/*****************************************************************************************************************
NAME:    EC_IT143_W3.4_au.sql
PURPOSE: Answering eight AdventureWorks questions across marginal, moderate, increased, and metadata complexity.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/14/2026   [Your Name]   1. Built this script for EC IT143 W3.4 AdventureWorks Create Answers assignment.

RUNTIME: 
~1 second

NOTES: 
This script answers two of my own questions and six questions created by classmates from the W3.3 discussion board.
******************************************************************************************************************/

USE AdventureWorks2022;
GO

-- ===============================================================================================================
-- BUSINESS USER QUESTIONS: MARGINAL COMPLEXITY
-- ===============================================================================================================

-- Q1 (Author: Me): Which five salaried employees have the highest number of remaining vacation hours?
SELECT TOP 5 
    BusinessEntityID, 
    JobTitle, 
    VacationHours
FROM HumanResources.Employee
WHERE SalariedFlag = 1
ORDER BY VacationHours DESC;


-- Q2 (Author: Eduard Ovcharenko): How many products have a list price greater than $1,000?
SELECT 
    COUNT(ProductID) AS ProductsOver1000
FROM Production.Product
WHERE ListPrice > 1000;


-- ===============================================================================================================
-- BUSINESS USER QUESTIONS: MODERATE COMPLEXITY
-- ===============================================================================================================

-- Q3 (Author: Eulaine Dickson): I would like to know which customers place the most orders. 
-- Can you show the top five customers based on total orders placed?
SELECT TOP 5 
    c.CustomerID, 
    p.FirstName, 
    p.LastName, 
    COUNT(soh.SalesOrderID) AS TotalOrders
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS soh 
    ON c.CustomerID = soh.CustomerID
LEFT JOIN Person.Person AS p 
    ON c.PersonID = p.BusinessEntityID
GROUP BY 
    c.CustomerID, 
    p.FirstName, 
    p.LastName
ORDER BY TotalOrders DESC;


-- Q4 (Author: Eduard Ovcharenko): I want to compare bike prices. What is the average product list price 
-- in each bike subcategory, rounded to two decimal places?
SELECT 
    ps.Name AS SubcategoryName, 
    CAST(ROUND(AVG(p.ListPrice), 2) AS DECIMAL(10, 2)) AS AvgListPrice
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps 
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc 
    ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bikes'
GROUP BY ps.Name
ORDER BY AvgListPrice DESC;


-- ===============================================================================================================
-- BUSINESS USER QUESTIONS: INCREASED COMPLEXITY
-- ===============================================================================================================

-- Q5 (Author: Edward Mubaiwa): Our sales director is preparing a report to evaluate product category performance. 
-- We need to examine sales throughout 2013. Can you show the monthly quantity sold and total sales revenue 
-- for each product category?
SELECT 
    MONTH(soh.OrderDate) AS OrderMonth, 
    pc.Name AS CategoryName, 
    SUM(sod.OrderQty) AS TotalQuantitySold, 
    SUM(sod.LineTotal) AS TotalSalesRevenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod 
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p 
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps 
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc 
    ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE YEAR(soh.OrderDate) = 2013
GROUP BY 
    MONTH(soh.OrderDate), 
    pc.Name
ORDER BY 
    OrderMonth ASC, 
    CategoryName ASC;


-- Q6 (Author: Eulaine Dickson): Management would like to better understand customer purchasing habits. 
-- Can you create a report showing the top ten customers by total spending, including the number of orders 
-- they placed and the total amount they spent?
SELECT TOP 10 
    c.CustomerID, 
    p.FirstName, 
    p.LastName, 
    COUNT(soh.SalesOrderID) AS TotalOrders, 
    SUM(soh.TotalDue) AS TotalAmountSpent
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS soh 
    ON c.CustomerID = soh.CustomerID
LEFT JOIN Person.Person AS p 
    ON c.PersonID = p.BusinessEntityID
GROUP BY 
    c.CustomerID, 
    p.FirstName, 
    p.LastName
ORDER BY TotalAmountSpent DESC;


-- ===============================================================================================================
-- METADATA QUESTIONS (SYSTEM INFORMATION SCHEMA VIEWS)
-- ===============================================================================================================

-- Q7 (Author: Me): Which tables in the AdventureWorks database include a column named BusinessEntityID, 
-- and what is the data type for each?
SELECT 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'BusinessEntityID'
ORDER BY 
    TABLE_SCHEMA ASC, 
    TABLE_NAME ASC;


-- Q8 (Author: Eduard Ovcharenko): What are the column names, data types, and nullability settings 
-- in Production.Product, listed in their original column order?
SELECT 
    ORDINAL_POSITION, 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production' 
    AND TABLE_NAME = 'Product'
ORDER BY ORDINAL_POSITION ASC;
