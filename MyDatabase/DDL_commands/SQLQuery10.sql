-- Add a new column called last_name to the persons table

ALTER TABLE persons
ADD last_name VARCHAR(50) NOT NULL

-- Remove the column last_name from the persons table

ALTER TABLE persons
DROP COLUMN last_name 

-- Delete the table persons from the database

DROP TABLE persons