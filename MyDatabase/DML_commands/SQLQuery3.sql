-- Change the score of customer with ID 6 to 0

UPDATE customers
SET score = 0
WHERE id = 6

-- Change the score of customer with ID 6 to 100 and update the countey to UK

UPDATE customers
SET score = 100,
	country = 'UK'
WHERE id = 6

SELECT *
FROM customers

-- Update all customers eith a NULL score by setting their score to 0
UPDATE customers
SET score = 0
WHERE score is NULL


SELECT *
FROM customers