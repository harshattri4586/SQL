/*
	Comparison operator
*/

-- Retrieve all customers from Germany.

SELECT * 
FROM customers
WHERE country = 'Germany'

-- Retrieve all customers who are no from Germany.

SELECT *
FROM customers
WHERE country != 'Germany'

-- Retrieve all customers with a score greater than 500

SELECT *
FROM customers
WHERE score > 500

-- Retrieve all customers with a score 500 or more 

SELECT *
FROM customers
WHERE score >= 500

-- Retrieve all customers with a score lesser than 500

SELECT *
FROM customers
WHERE score < 500

-- Retrieve all customers with a score 500 or less 

SELECT *
FROM customers
WHERE score <= 500


/*
	Logical operator
*/

-- Retrieve all customers with a score less than 500 and country be USA

SELECT *
FROM customers
WHERE score < 500 AND country = 'USA'

-- Retrieve all customers with a score NOT less than 100

SELECT *
FROM customers
WHERE NOT score < 100

/*
	Range operator
*/

-- Retrieve all customers whose score falls in the range between 100 and 1000

SELECT *
FROM customers
WHERE score BETWEEN 100 AND 1000

/*
	Membership operator
*/

-- Retrieve all customers from either Germany OR INDIA

SELECT *
FROM customers
WHERE country IN ('Germany', 'INDIA')
-- NOT IN operator is opposite of IN operator

/*
	Search operator
*/

-- Find all customers whose first_name starts with 'M'

SELECT *
FROM customers
WHERE first_name LIKE 'M%'
 