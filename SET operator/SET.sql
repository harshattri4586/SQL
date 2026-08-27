-- UNION
/*
Combine the data from employees and customers into one table
*/

SELECT 
	FirstName,
	LastName
FROM Sales.Customers
UNION 
SELECT 
	FirstName,
	LastName
FROM Sales.Employees

-- UNION ALL
/*
Combine the data from employees and customers into one table
*/

SELECT 
	FirstName,
	LastName
FROM Sales.Customers
UNION ALL
SELECT 
	FirstName,
	LastName
FROM Sales.Employees

-- EXCEPT
/*
Find the employees who are not customers at the samw time
*/

SELECT 
	FirstName,
	LastName
FROM Sales.Employees
EXCEPT
SELECT 
	FirstName,
	LastName
FROM Sales.Customers

-- INTERSECT
/*
Find the employees, who are also customers
*/

SELECT 
	FirstName,
	LastName
FROM Sales.Employees
INTERSECT
SELECT 
	FirstName,
	LastName
FROM Sales.Customers

-- TASK

/*
Orders data are stored in separate tables orders and OrdersArchieve.
Combine all ordera into one report without duplication
*/

SELECT 
	*
FROM Sales.Orders
UNION
SELECT 
	* 
FROM Sales.OrdersArchive