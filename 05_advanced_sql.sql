
USE ecommerce_product_analytics;

-- 1. Rank products by price
SELECT
    product_name,
    price,
    RANK() OVER (ORDER BY price DESC) AS price_rank
FROM products
WHERE price IS NOT NULL;

-- 2. Assign a unique row number to each product
SELECT
    product_name,
    price,
    ROW_NUMBER() OVER (ORDER BY price DESC) AS row_num
FROM products
WHERE price IS NOT NULL;

-- 3. Find the top 3 distinct price ranks
WITH product_rank AS (
    SELECT
        product_name,
        price,
        DENSE_RANK() OVER (ORDER BY price DESC) AS price_rank
    FROM products
    WHERE price IS NOT NULL
)
SELECT *
FROM product_rank
WHERE price_rank <= 3;

-- 4. Find products priced above the overall average
SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- 5. Calculate average price by brand using a CTE
WITH brand_avg AS (
    SELECT
        brand_id,
        AVG(price) AS avg_brand_price
    FROM products
    GROUP BY brand_id
)
SELECT *
FROM brand_avg
WHERE avg_brand_price > 1000
ORDER BY avg_brand_price DESC;