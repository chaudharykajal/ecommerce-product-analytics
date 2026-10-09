# E-commerce Product Analytics Using MySQL

## 1. Project Overview

This project demonstrates how MySQL can be used to explore product data, identify data-quality issues, perform data cleaning, and answer business questions using SQL.

The project covers the analytical workflow from raw data inspection to business-focused queries and findings.

## 2. Business Objectives

* Identify and investigate data-quality issues.
* Improve product data consistency.
* Analyze product pricing across categories and brands.
* Calculate inventory value by brand.
* Identify products with low stock levels.
* Demonstrate SQL techniques used in real-world data analysis.

## 3. Tools and Technologies

* **Database:** MySQL 8.0
* **IDE:** MySQL Workbench
* **Language:** SQL
* **Version Control:** Git and GitHub (planned)

## 4. Database Structure

| Table / View              | Purpose                                         |
| ------------------------- | ----------------------------------------------- |
| `raw_products`            | Preserves the original source data              |
| `clean_products`          | Working dataset for cleaning and quality checks |
| `products`                | Product dataset used for business analysis      |
| `brands`                  | Brand reference data                            |
| `categories`              | Category reference data                         |
| `suppliers`               | Supplier reference data                         |
| `vw_product_data_quality` | View for inspecting data quality                |

## 5. Data Quality Assessment

Initial validation of `clean_products` identified four issues across four records:

| Product                        | Issue                   |
| ------------------------------ | ----------------------- |
| Digital Blood Pressure Monitor | Missing price           |
| Surgical Gloves                | Negative price          |
| Dental Mirror Set              | Missing stock quantity  |
| Hand Sanitizer                 | Negative stock quantity |

The original `raw_products` table contains 9 rows, while `clean_products` and `products` each contain 8 rows.

The original dataset was preserved. Flagged values should be investigated using verified source information before correction.

## 6. SQL Concepts Demonstrated

* Filtering, sorting, and conditional logic
* Aggregate functions: `COUNT()`, `AVG()`, and `SUM()`
* `GROUP BY` and `HAVING`
* Inner and left joins
* Subqueries and correlated subqueries
* Common Table Expressions (CTEs)
* Window functions: `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()`
* Duplicate detection and data-quality validation

## 7. Business Questions

The SQL analysis explores questions such as:

1. Which brands have the most products?
2. Which products are priced above the overall average?
3. Which products have the second- or third-highest distinct prices?
4. Which brands have average prices above the overall average?
5. What is the total inventory value for each brand?
6. Which categories have average product prices above ₹1,000?
7. Which products have stock quantities below 50?

## 8. Key Findings

* One duplicate row was removed from the working dataset.
* Four data-quality issues were identified for review.
* SQL queries were developed to analyze pricing, brand performance, inventory value, and low-stock products.

Detailed business conclusions should be added after validating the corresponding query results.

## 9. Project Limitations

This is a small demonstration dataset containing eight rows in the cleaned and analysis tables. It is suitable for demonstrating SQL skills but is too small to support broad market conclusions.

## 10. Future Enhancements

* Expand the dataset with a larger, credible source.
* Resolve flagged data-quality issues using verified information.
* Add Python-based analysis and visualizations.
* Build an interactive Power BI dashboard.

## Author

Kajal Chaudhary

**Focus:** Data Analytics | MySQL | SQL-based Business Analysis
