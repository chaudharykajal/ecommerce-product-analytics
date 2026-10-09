
USE ecommerce_product_analytics;

-- 1. Compare row counts
SELECT 'raw_products' AS table_name, COUNT(*) AS total_rows
FROM raw_products
UNION ALL
SELECT 'clean_products', COUNT(*)
FROM clean_products
UNION ALL
SELECT 'products', COUNT(*)
FROM products;

-- 2. Summarize data-quality issues
SELECT
    COUNT(*) AS total_rows,
    SUM(price IS NULL) AS missing_prices,
    SUM(price < 0) AS negative_prices,
    SUM(stock_quantity IS NULL) AS missing_stock,
    SUM(stock_quantity < 0) AS negative_stock
FROM clean_products;

-- 3. Identify affected records
SELECT
    raw_product_id,
    product_name,
    price,
    stock_quantity
FROM clean_products
WHERE price IS NULL
   OR price < 0
   OR stock_quantity IS NULL
   OR stock_quantity < 0;