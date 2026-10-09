
USE ecommerce_product_analytics;

-- Data cleaning documentation
-- Original raw_products table remains unchanged.
-- Cleaning was performed on clean_products.

-- 1. Check for duplicate records
SELECT
    raw_product_id,
    product_name,
    category,
    brand,
    price,
    stock_quantity,
    source_platform,
    product_url,
    created_at,
    COUNT(*) AS duplicate_count
FROM clean_products
GROUP BY
    raw_product_id,
    product_name,
    category,
    brand,
    price,
    stock_quantity,
    source_platform,
    product_url,
    created_at
HAVING COUNT(*) > 1;

-- 2. Review product-name and category consistency
SELECT DISTINCT product_name
FROM clean_products
ORDER BY product_name;

SELECT DISTINCT category
FROM clean_products
ORDER BY category;

-- 3. Identify records requiring data-quality review
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

-- 4. Check for missing product URLs
SELECT raw_product_id, product_name
FROM clean_products
WHERE product_url IS NULL
   OR TRIM(product_url) = '';

-- 5. Duplicate-removal logic used for cleaning
-- Documentation only: do not execute this DELETE again.
-- The original raw_products table remains unchanged.

-- DELETE FROM clean_products
-- WHERE clean_row_id IN (
--     SELECT clean_row_id
--     FROM (
--         SELECT
--             clean_row_id,
--             ROW_NUMBER() OVER (
--                 PARTITION BY
--                     raw_product_id,
--                     product_name,
--                     category,
--                     brand,
--                     price,
--                     stock_quantity,
--                     source_platform,
--                     product_url,
--                     created_at
--                 ORDER BY clean_row_id
--             ) AS rn
--         FROM clean_products
--     ) AS duplicates
--     WHERE rn > 1
-- );

-- Note:
-- Missing or invalid values should be corrected only
-- after verifying the appropriate source information.
