USE sales_data;

-- DDL - Data Definition Language
-- create customer table
CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

-- delete the customer table permanently
DROP TABLE customers;

-- add new column to products table
ALTER TABLE products
ADD stock_quantity INT
DEFAULT 0;

-- DML - Data Manipulation Language
-- insert a new sale in the sales table
INSERT INTO sales (sale_id, product_id, quantity, sale_date)
VALUES (106, 3, 1, '2025-09-25');

-- update product stock
UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 3;

-- delete a sale from sales table
DELETE FROM sales
WHERE sale_id = 106;

-- SELECT *
-- FROM sales;

-- SELECT *
-- FROM products;


-- DCL - Data Control Language
-- create local user to access the database
CREATE USER 'local_user'@'localhost' IDENTIFIED BY 'Ola12345';

-- grant permission to local user
GRANT SELECT, INSERT ON sales_data.* TO 'local_user'@'localhost';

FLUSH PRIVILEGES; -- Apply changes to the user access

-- revoke permission to the user
REVOKE INSERT ON sales_data.* FROM 'local_user'@'localhost';

-- TCL - Transaction Control Language
-- start transaction
START TRANSACTION;

-- multiple operations treated as one
UPDATE products SET stock_quantity = stock_quantity - 2 WHERE product_id = 2;
INSERT INTO sales (sale_id, product_id, quantity, sale_date)
VALUES (107, 2, 2, '2025-09-26');

COMMIT;

ROLLBACK; -- only if error in above operations


-- poor data quality - failed transaction with rollback
-- start transaction
START TRANSACTION;

-- reduce stock for a product that doesn't exist in the products table (id = 999)
UPDATE products 
SET stock_quantity = stock_quantity - 1
WHERE product_id = 999;

-- insert a sale for the product that doesn't exists
INSERT INTO sales (sale_id, product_id, quantity, sale_date)
VALUES (201, 999, 1, '2025-09-27');

-- realize error, so cancel everything - no changes saved
ROLLBACK;








