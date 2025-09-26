USE sales_data;

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