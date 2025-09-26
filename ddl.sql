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
-- 






