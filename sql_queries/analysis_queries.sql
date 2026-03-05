/* =====================================================
Atliq Hardware - Market & Product Performance Analysis
SQL Business Analysis Queries
===================================================== */


-- -----------------------------------------------------
-- 1. Total Sales Records in Dataset
-- -----------------------------------------------------

SELECT COUNT(*) AS total_sales_records
FROM fact_sales_monthly;



-- -----------------------------------------------------
-- 2. Total Unique Products Sold
-- -----------------------------------------------------

SELECT COUNT(DISTINCT product_code) AS total_products
FROM fact_sales_monthly;



-- -----------------------------------------------------
-- 3. Total Unique Customers
-- -----------------------------------------------------

SELECT COUNT(DISTINCT customer_code) AS total_customers
FROM fact_sales_monthly;



-- -----------------------------------------------------
-- 4. Sales Data Time Range
-- -----------------------------------------------------

SELECT MIN(date) AS start_date,
       MAX(date) AS end_date
FROM fact_sales_monthly;



-- -----------------------------------------------------
-- 5. Total Company Revenue
-- -----------------------------------------------------

SELECT
SUM(s.sold_quantity * gp.gross_price) AS total_revenue
FROM fact_sales_monthly s
JOIN fact_gross_price gp
ON s.product_code = gp.product_code
AND gp.fiscal_year = YEAR(s.date);



-- -----------------------------------------------------
-- 6. Top Products by Revenue
-- -----------------------------------------------------

SELECT
p.product,
SUM(s.sold_quantity * gp.gross_price) revenue
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
JOIN fact_gross_price gp
ON s.product_code = gp.product_code
AND gp.fiscal_year = YEAR(s.date)
GROUP BY p.product
ORDER BY revenue DESC
LIMIT 10;



-- -----------------------------------------------------
-- 7. Top Products by Profit
-- -----------------------------------------------------

SELECT
p.product,
SUM(s.sold_quantity * gp.gross_price) AS revenue,
SUM(s.sold_quantity * mc.manufacturing_cost) AS manufacturing_cost,
SUM(s.sold_quantity * gp.gross_price) -
SUM(s.sold_quantity * mc.manufacturing_cost) AS profit
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
JOIN fact_gross_price gp
ON s.product_code = gp.product_code
AND gp.fiscal_year = YEAR(s.date)
JOIN fact_manufacturing_cost mc
ON s.product_code = mc.product_code
AND mc.cost_year = YEAR(s.date)
GROUP BY p.product
ORDER BY profit DESC
LIMIT 10;



-- -----------------------------------------------------
-- 8. Top Customers by Revenue
-- -----------------------------------------------------

SELECT
c.customer,
SUM(s.sold_quantity * gp.gross_price) AS revenue
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
JOIN fact_gross_price gp
ON s.product_code = gp.product_code
AND gp.fiscal_year = YEAR(s.date)
GROUP BY c.customer
ORDER BY revenue DESC
LIMIT 10;



-- -----------------------------------------------------
-- 9. Revenue Contribution % by Customer
-- -----------------------------------------------------

SELECT
c.customer,
SUM(s.sold_quantity * gp.gross_price) AS revenue,
ROUND(
SUM(s.sold_quantity * gp.gross_price) /
SUM(SUM(s.sold_quantity * gp.gross_price)) OVER() * 100
,2) AS revenue_percentage
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
JOIN fact_gross_price gp
ON s.product_code = gp.product_code
AND gp.fiscal_year = YEAR(s.date)
GROUP BY c.customer
ORDER BY revenue DESC
LIMIT 10;



-- -----------------------------------------------------
-- 10. Revenue by Year
-- -----------------------------------------------------

SELECT
YEAR(s.date) AS year,
SUM(s.sold_quantity * gp.gross_price) AS revenue
FROM fact_sales_monthly s
JOIN fact_gross_price gp
ON s.product_code = gp.product_code
AND gp.fiscal_year = YEAR(s.date)
GROUP BY YEAR(s.date)
ORDER BY year;



-- -----------------------------------------------------
-- 11. Year-over-Year Revenue Growth
-- -----------------------------------------------------

SELECT
year,
revenue,
LAG(revenue) OVER (ORDER BY year) AS previous_year_revenue,
ROUND(
(revenue - LAG(revenue) OVER (ORDER BY year))
/ LAG(revenue) OVER (ORDER BY year) * 100
,2) AS YoY_growth_percent
FROM
(
SELECT
YEAR(s.date) AS year,
SUM(s.sold_quantity * gp.gross_price) AS revenue
FROM fact_sales_monthly s
JOIN fact_gross_price gp
ON s.product_code = gp.product_code
AND gp.fiscal_year = YEAR(s.date)
GROUP BY YEAR(s.date)
) yearly_revenue;



-- -----------------------------------------------------
-- 12. Customer Segmentation Based on Revenue
-- -----------------------------------------------------

SELECT customer,revenue,

CASE
WHEN revenue > 500000000 THEN 'High Value Customer'
WHEN revenue BETWEEN 200000000 AND 500000000 THEN 'Medium Value Customer'
ELSE 'Low Value Customer'
END AS customer_segment

FROM
(
SELECT
c.customer,
SUM(s.sold_quantity * gp.gross_price) AS revenue
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
JOIN fact_gross_price gp
ON s.product_code = gp.product_code
AND gp.fiscal_year = YEAR(s.date)
GROUP BY c.customer
) t

ORDER BY revenue DESC;



-- -----------------------------------------------------
-- 13. Market Ranking by Revenue
-- -----------------------------------------------------

SELECT
market,
revenue,
RANK() OVER (ORDER BY revenue DESC) AS market_rank
FROM
(
SELECT
c.market,
SUM(s.sold_quantity * gp.gross_price) AS revenue
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
JOIN fact_gross_price gp
ON s.product_code = gp.product_code
AND gp.fiscal_year = YEAR(s.date)
GROUP BY c.market
) t;
