
SELECT 
OrderID,
OrderDate,
ShipDate,
CreationTime
FROM Sales.Orders


SELECT 
OrderID,
CreationTime,
YEAR(CreationTime) AS Year,
MONTH(CreationTime) Month,
DAY(CreationTime) Day
FROM Sales.Orders


SELECT
OrderID,
CreationTime,
-- DATETRUNC Examples
DATETRUNC(day, CreationTime) Day_dt,
DATETRUNC(minute, CreationTime) Minute_dt,
-- DATEPART Examples
DATEPART(week, CreationTime) week_dp,
DATEPART(year, CreationTime) year_dp,
DATEPART(mm, CreationTime) month_dp,
DATEPART(dd, CreationTime) day_dp,
DATEPART(hour, CreationTime) hour_dp,
DATEPART(quarter, CreationTime) quarter_dp
FROM Sales.Orders


-- How many orders were placed each year?

SELECT
YEAR(OrderDate),
COUNT(*) NrofOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)


-- How many orders were placed each year?

SELECT
DATENAME(mm,OrderDate),
COUNT(*) NrofOrders
FROM Sales.Orders
GROUP BY DATENAME(mm,OrderDate)


-- Show all orders that were placed during the month of february

SELECT
*
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2


SELECT
OrderID,
CreationTime,
FORMAT(CreationTime, 'MM-dd-yyyy') USA_format,
FORMAT(CreationTime, 'dd') dd,
FORMAT(CreationTime, 'ddd') ddd,
FORMAT(CreationTime, 'dddd') dddd,
FORMAT(CreationTime, 'MM') MM,
FORMAT(CreationTime, 'MMM') MMM,
FORMAT(CreationTime, 'MMMM') MMMM
FROM Sales.Orders


-- Show CreationTime using the following Format:
-- Day Wed Jan Q1 2025 12:34:56 PM

SELECT
OrderID,
CreationTime,
'Day ' + FORMAT(CreationTime, 'ddd MMM') +
' Q' + DATENAME(quarter, CreationTime) + 
' ' + FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS CustomFormat
FROM Sales.Orders


SELECT 
CreationTime,
CONVERT(Date , CreationTime)  AS [DateTime to Date CONVERT],
CONVERT(VARCHAR, CreationTime, 32)  AS [USA Std. style:32] 
FROM Sales.Orders


SELECT
CAST('123' AS INT) AS [String to Int],
CAST(123 AS VARCHAR) AS [Int to String],
CAST('2025-08-20' AS DATE)  AS [String to Date],
CAST('2025-08-20' AS DATETIME2) AS [String to DateTime]


SELECT
OrderID,
OrderDate,
DATEADD(day, -10, OrderDate) AS TenDaysBefore,
DATEADD(month, 3, OrderDate) AS ThreeMonthsLater,
DATEADD(year, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders


-- Calculate the age of employees

SELECT 
EmployeeID,
BirthDate,
DATEDIFF(year, BirthDate, GETDATE()) Age
FROM Sales.Employees


-- Find the avergae shipping duration in days for each month

SELECT
MONTH(OrderDate) AS OrderDate,
AVG(DATEDIFF(day, OrderDate, ShipDate)) AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate)


-- Time Gap Analysis
-- Find the number of days between each order and the previous order

SELECT 
OrderID,
OrderDate CurrentOrderDate,
LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS NrOfDays
FROM Sales.Orders