/*****************************************************************************************************************
NAME:    EC_IT143_W3.4
PURPOSE: Answering all 8 questions from AdventureWorks database.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     1/28/2025   FSELEMANI      1. Complete this script for 3.4 assignment.


RUNTIME: 
Xm Xs

NOTES: 
For questions selected, I have chosen:
Q1 - Marginal - Another Student
Q2 - Marginal - Another Student
Q3 - Moderate - Another Student
Q4 - Moderate - Another Student
Q5 - Increased - Me
Q6 - Increased - Another student
Q7 - Metadata - Me
Q8 - Metadata - Another Student
*/

-- Q1: What is the most expensive product listed in the AdventureWorks catalog?
-- A1: Work with Production.Product table.

SELECT TOP 1 *
FROM Production.Product
ORDER BY ListPrice DESC;

-- Q2: What is the total revenue from all sales in the Sales.SalesOrderHeader table?
-- A2: Work with Sales.SalesOrderHeader

SELECT SUM(TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader;

-- Q3: How many products in the "Bikes" category are out of stock as of the end of 2024?
-- A3: Join two tables (ProductInventory and ProductSubcategory) using JOIN

SELECT COUNT(*) BikesOutOfStocks
FROM Production.Product AS P
	INNER JOIN Production.ProductSubcategory AS PS 
		ON P.ProductSubcategoryID = PS.ProductSubcategoryID
	INNER JOIN Production.ProductInventory AS PI
		ON P.ProductID = PI.ProductID
WHERE PS.Name = 'Bikes' AND PI.Quantity = 0;

-- Q4: Can I get a list of the top 10 products based on total sales revenue? Please include the product name, 
--     total revenue (list price × quantity sold), and the total quantity sold.
-- A4: Join two tables (SalesOrderDetail and Product) using JOIN

SELECT TOP 10
	P.ProductID
	, P.Name
	, SUM(SOD.UnitPrice * SOD.OrderQty) AS TotalRevenue
	, SUM(SOD.OrderQty) AS TotalQuantitySold
FROM Production.Product AS P
	INNER JOIN Sales.SalesOrderDetail AS SOD ON P.ProductID = SOD.ProductID
GROUP BY P.ProductID, P.Name
ORDER BY TotalRevenue DESC;

-- Q5: We need to identify our premium road bike customers. So, set "premium" as 
--     customers who have purchased at least two road bikes with a total order value 
--     exceeding $5,000 across all their orders. The table should contain 
--     the CustomerID, their total road bike purchase amount, and the number of road 
--     bikes they've purchased, ordering it all by purchase amount in descending way.
-- A5: Join four tables using JOIN

SELECT c.CustomerID
    , SUM(sod.UnitPrice * sod.OrderQty) AS TotalRoadBikePurchaseAmount
    , SUM(sod.OrderQty) AS NumberOfRoadBikes
FROM Sales.Customer c
	INNER JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
	INNER JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
	INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
	INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE ps.Name = 'Road Bikes'
GROUP BY c.CustomerID
HAVING SUM(sod.OrderQty) >= 2
	AND SUM(sod.UnitPrice * sod.OrderQty) > 5000
ORDER BY TotalRoadBikePurchaseAmount DESC;

-- Q6: I need to analyze mountain bike orders from Q3 2012. Provide a report of frame color, 
--     quantity sold, list price, and an estimated net revenue (list price minus standard cost).
-- A6: Join four tables using INNER JOIN

SELECT p.Color
	, SUM(sod.OrderQty) AS QuantitySold
	, p.ListPrice
	, SUM(sod.OrderQty * (p.ListPrice - pch.StandardCost)) AS EstimatedNetRevenue
FROM Production.Product p
	INNER JOIN Production.ProductSubcategory ps 
		ON p.ProductSubcategoryID = ps.ProductSubcategoryID
	INNER JOIN Production.ProductCostHistory pch 
		ON p.ProductID = pch.ProductID
	INNER JOIN Sales.SalesOrderDetail sod 
		ON p.ProductID = sod.ProductID
	INNER JOIN Sales.SalesOrderHeader soh 
		ON sod.SalesOrderID = soh.SalesOrderID
WHERE ps.Name = 'Mountain Bikes'
	AND DATEPART(QUARTER, soh.OrderDate) = 3
	AND DATEPART(YEAR, soh.OrderDate) = 2012
GROUP BY p.Color, p.ListPrice;

-- Q7: In need to identify nullable columns from the Person table, 
--     list the column name, data type, and whether it's nullable (yes/no)
-- A7: Join 2 tables using INNER JOIN

SELECT
	c.name AS ColumnName
	, t.name AS DataType
	, CASE
		WHEN c.is_nullable = 1 THEN 'Yes'
		ELSE 'No'
	END AS IsNullable
FROM sys.columns c
	INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('Person.Person');

-- Q8: How many columns are in the Sales.SalesOrderDetail table, 
--     and what are their data types?
-- A8: Join 2 tables using INNER JOIN

SELECT
	c.name AS ColumnName
	, t.name AS DataType
FROM sys.columns c
	INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('Sales.SalesOrderDetail');