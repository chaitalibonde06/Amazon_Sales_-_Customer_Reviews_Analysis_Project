-- Create the database
CREATE DATABASE amazon_sales_db;

-- Use the database
USE amazon_sales_db;

-- Create the table
CREATE TABLE amazon_products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name TEXT,
    main_category VARCHAR(50),
    sub_category VARCHAR(100),
    discounted_price DECIMAL(10,2),
    actual_price DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    discount_percentage INT,
    price_range VARCHAR(20),
    rating DECIMAL(3,1),
    rating_count INT,
    total_sales DECIMAL(15,2)
);


-- Create the table again with a character set that supports all characters
CREATE TABLE amazon_products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name TEXT,
    main_category VARCHAR(50),
    sub_category VARCHAR(100),
    discounted_price DECIMAL(10,2),
    actual_price DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    discount_percentage INT,
    price_range VARCHAR(20),
    rating DECIMAL(3,1),
    rating_count INT,
    total_sales DECIMAL(15,2)
) DEFAULT CHARSET = utf8mb4;

-- Remove all existing records (the table structure stays)
TRUNCATE TABLE amazon_products;

-- Check that the table is empty
SELECT COUNT(*) FROM amazon_products;

-- Check the total estimated sales
SELECT SUM(total_sales) FROM amazon_products;


-- **SQL Tasks**
-- 1. Calculate total sales by product category.
SELECT main_category, ROUND(SUM(total_sales), 2) AS Total_Sales
FROM amazon_products
GROUP BY main_category
ORDER BY total_sales DESC;

-- 2. Find the top 10 highest-selling products.
SELECT product_name, total_sales
FROM amazon_products
ORDER BY total_sales DESC
LIMIT 10;

-- 3. Retrieve products with the highest ratings.
SELECT product_name, rating
FROM amazon_products
WHERE rating = (SELECT MAX(rating) FROM amazon_products);

-- 4. Calculate the average product rating.
SELECT ROUND(AVG(rating), 2) AS Average_Rating
FROM amazon_products;

-- 5. Find products with the maximum discount.
SELECT product_name, discount_percentage
FROM amazon_products
WHERE discount_percentage = (SELECT MAX(discount_percentage) FROM amazon_products);

-- 6. Count products in each category.
SELECT main_category, COUNT(*) AS product_count
FROM amazon_products
GROUP BY main_category
ORDER BY product_count DESC;

-- 7. Find products with low ratings (<3).
SELECT product_name, rating
FROM amazon_products
WHERE rating < 3
ORDER BY rating ASC;

-- 8. Rank products by total sales.
SELECT product_name, total_sales,
       RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM amazon_products
ORDER BY sales_rank
LIMIT 20;

-- 9. Find the average product price by category.
SELECT main_category, ROUND(AVG(discounted_price), 2) AS avg_price
FROM amazon_products
GROUP BY main_category
ORDER BY avg_price DESC;

-- 10. Identify products with the highest number of reviews.
SELECT product_name, rating_count
FROM amazon_products
ORDER BY rating_count DESC
LIMIT 10;