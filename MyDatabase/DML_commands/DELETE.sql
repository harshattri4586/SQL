-- Delete all customers with an ID less than 4

SELECT *
FROM customers

DELETE FROM customers
WHERE id < 4

SELECT *
FROM customers

-- Delete all data from table persons

SELECT *
FROM persons

DELETE FROM persons
/* 
TRUNCATE TABLE persons
*/

SELECT *
FROM persons