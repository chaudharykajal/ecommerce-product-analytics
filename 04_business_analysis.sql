
USE ecommerce_product_analytics;

-- 1. Count products by brand
SELECT
    brand_id,
    COUNT(*) AS total_products
FROM products
GROUP BY brand_id
ORDER BY total_products DESC;

-- 2. Find products priced above the overall average
SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;

-- 3. Calculate inventory value by brand
SELECT
    brand_id,
    SUM(price * stock_quantity) AS total_inventory_value
FROM products
WHERE price IS NOT NULL
  AND stock_quantity IS NOT NULL
GROUP BY brand_id
ORDER BY total_inventory_value DESC;

-- 4. Find products with low stock
SELECT
    product_name,
    category,
    stock_quantity,
    price
FROM products
WHERE stock_quantity < 50
  AND stock_quantity IS NOT NULL
ORDER BY stock_quantity ASC;

-- 5. Find categories with average price above 1000
SELECT
    category,
    AVG(price) AS average_price,
    COUNT(*) AS products_with_prices
FROM products
WHERE price IS NOT NULL
GROUP BY category
HAVING AVG(price) > 1000
ORDER BY average_price DESC;