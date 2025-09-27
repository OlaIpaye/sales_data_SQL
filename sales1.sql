CREATE DATABASE sales_data;

USE sales_data;

-- created products table
CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

-- Insert sample products
INSERT INTO products (product_id, product_name, category) VALUES
(1, 'Samsung TV 43', 'Electronics'),
(2, 'iPhone 16 Pro', 'Mobiles'),
(3, 'Dell Laptop XPS 13', 'Computers'),
(4, 'Sony Headphones WH-1000XM5', 'Audio'),
(5, 'Logitech Mouse M510', 'Accessories');

-- created sales table
CREATE TABLE sales (
	sales_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- renamed sales_id to sale_id in sales table
ALTER TABLE sales
RENAME COLUMN sales_id TO sale_id;

-- Insert sample sales
INSERT INTO sales (sale_id, product_id, quantity, sale_date) VALUES
(101, 1, 3, '2025-09-20'),
(102, 2, 1, '2025-09-21'),
(103, 2, 2, '2025-09-22'),
(104, 4, 5, '2025-09-23'),
(105, 5, 1, '2025-09-23'); -- product_id=6 doesn’t exist in products (data quality issue!)

-- view products table
SELECT *
FROM products;

-- view sales table
SELECT *
FROM sales;

-- Only products that got sold
SELECT p.product_id, p.product_name, s.sale_id, s.quantity, s.sale_date
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id;

-- Get all products, and sales if they exist
SELECT p.product_id, p.product_name, s.sale_id, s.quantity, s.sale_date
FROM products p
LEFT JOIN sales s
ON p.product_id = s.product_id;

-- Get all sales, and products if they exist
SELECT p.product_id, p.product_name, s.sale_id, s.quantity, s.sale_date
FROM products p
RIGHT JOIN sales s
ON p.product_id = s.product_id;

-- Get everything from both tables, matched or not - NO DUPLICATES
SELECT p.product_id, p.product_name, s.sale_id, s.quantity, s.sale_date
FROM products p
LEFT JOIN sales s
ON p.product_id = s.product_id
UNION
SELECT p.product_id, p.product_name, s.sale_id, s.quantity, s.sale_date
FROM products p
RIGHT JOIN sales s
ON p.product_id = s.product_id;

-- Get everything from both tables, matched or not - LEAVE DUPLICATES
SELECT p.product_id, p.product_name, s.sale_id, s.quantity, s.sale_date
FROM products p
LEFT JOIN sales s
ON p.product_id = s.product_id
UNION ALL
SELECT p.product_id, p.product_name, s.sale_id, s.quantity, s.sale_date
FROM products p
RIGHT JOIN sales s
ON p.product_id = s.product_id;

-- Sales for iPhone 16 Pro Only
SELECT p.product_id, p.product_name, p.category, s.sale_id, s.quantity, s.sale_date
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id
WHERE p.product_name = 'iPhone 16 Pro';



-- Find the Nth highest value
SELECT p.product_id, p.product_name, SUM(s.quantity) AS total_sold
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 1 OFFSET 1;  -- skip the first row (highest), return the second row





