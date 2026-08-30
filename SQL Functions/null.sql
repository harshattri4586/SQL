-- Find the average scores of the customers

SELECT
CustomerID,
Score,
AVG(Score) OVER() AvgScores,
AVG(COALESCE(Score, 0)) OVER() AvgScores2
FROM Sales.Customers


-- Display the full name of customers in a single field by 
-- merging their first and last names, and add 10 bonus points
-- to each custmer's score.

SELECT
CustomerID,
FirstName,
LastName,
FirstName + ' ' + COALESCE(LastName, '') AS FullName,
Score,
COALESCE(Score, 0) + 10 AS [Score with Bonus] 
FROM Sales.Customers


-- Sort the customers from lowest to highest scores,
-- with nulls appearing last

SELECT
CustomerID,
Score,
CASE WHEN Score IS NULL THEN 1 ELSE 0 END Flag
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score


-- Find the sales price for each order by dividing sales by quantity

SELECT 
OrderID,
Sales,
Quantity,
Sales/NULLIF(Quantity,0) AS Price
FROM Sales.Orders