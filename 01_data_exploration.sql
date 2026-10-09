
USE ecommerce_product_analytics;

-- 1. Inspect the original dataset
SELECT *
FROM raw_products;

-- 2. Check the table structure
DESCRIBE raw_products;
DESCRIBE clean_products;
DESCRIBE products;

-- 3. Compare row counts
SELECT 'raw_products' AS table_name, COUNT(*) AS total_rows
FROM raw_products
UNION ALL
SELECT 'clean_products', COUNT(*)
FROM clean_products
UNION ALL
SELECT 'products', COUNT(*)
FROM products;

-- 4. Explore product prices
SELECT
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    AVG(price) AS average_price
FROM products;

-- 5. Count products by category
SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;

-- 6. Inspect available brands
SELECT *
FROM brands;