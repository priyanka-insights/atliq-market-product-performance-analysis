# atliq-market-product-performance-analysis
SQL project analyzing global sales performance, product profitability, and market expansion opportunities for Atliq Hardware.
# Atliq Hardware – Market & Product Performance Analysis (SQL Project)

## Project Summary

This project analyzes the global sales performance of **Atliq Hardware**, a computer hardware manufacturer operating across multiple international markets and distribution channels.

Using **SQL (MySQL)**, the project explores more than **1.4 million sales records** to identify revenue drivers, profitable products, customer contribution patterns, and market performance trends.

The objective of this analysis is to support **data-driven business decisions** regarding market expansion, product optimization, and revenue growth.

---

# Key Metrics

| Metric              | Value               |
| ------------------- | ------------------- |
| Total Sales Records | 1,425,706           |
| Total Products      | 389                 |
| Total Customers     | 209                 |
| Data Period         | Sep 2017 – Dec 2021 |
| Total Revenue       | $3.5B+              |

---

# Business Problem

Atliq Hardware sells hundreds of products across multiple markets through different distribution channels.

However, management lacks clear insights into:

* Which markets generate the highest revenue
* Which products drive company sales
* Which products generate the most profit
* Which customers contribute the largest share of revenue
* How the company's revenue has grown over time

This project answers these questions using **SQL-based business analysis**.

---

# Dataset Overview

The dataset follows a **data warehouse structure** optimized for analytics.

## Dimension Tables

* `dim_customer`
* `dim_product`
* `dim_date`

## Fact Tables

* `fact_sales_monthly`
* `fact_gross_price`
* `fact_manufacturing_cost`
* `fact_freight_cost`
* `fact_pre_invoice_deductions`
* `fact_post_invoice_deductions`
* `fact_forecast_monthly`

---

# Business Structure

## Customers

Examples include:

* Amazon
* Atliq Exclusive
* Atliq e Store

## Sales Channels

Products are distributed through:

* Retailers
* Distributors
* Direct Channels

## Markets

The company operates in multiple global markets including:

* India
* United States
* South Korea
* Canada
* United Kingdom

---

# Analytical Approach

The project follows a structured data analysis workflow:

1. Data exploration
2. Revenue analysis
3. Product performance analysis
4. Profitability analysis
5. Customer contribution analysis
6. Revenue trend analysis
7. Customer segmentation
8. Market ranking

A total of **13 SQL queries** were written to perform this analysis.

---

# SQL Analysis Performed

## Data Exploration

1. Total Sales Records
2. Total Unique Products
3. Total Unique Customers
4. Dataset Date Range

---

## Revenue Analysis

5. Total Company Revenue
6. Top Products by Revenue

---

## Profitability Analysis

7. Top Products by Profit

---

## Customer Analysis

8. Top Customers by Revenue
9. Revenue Contribution Percentage

---

## Time Series Analysis

10. Revenue by Year
11. Year-over-Year Revenue Growth

---

## Segmentation & Ranking

12. Customer Segmentation
13. Market Ranking by Revenue

---

# Visual Results

## Top Markets by Revenue

![Market Revenue](screenshots/market_revenue.png)

---

## Top Products by Profit

![Top Products](screenshots/top_products_profit.png)

---

## Customer Revenue Contribution

![Customer Contribution](screenshots/customer_revenue.png)

---

## Revenue Growth Trend

![Revenue Growth](screenshots/yoy_growth.png)

---

# Key Business Insights

## Market Performance

India and the United States are the **largest revenue generating markets**, indicating strong demand in these regions.

---

## Product Performance

The **AQ BZ product series** plays a major role in driving company revenue and profitability.

---

## Customer Concentration

A small number of customers contribute a **significant portion of total revenue**, highlighting potential revenue concentration risks.

---

## Revenue Growth

The company experienced rapid growth:

* **2018 → $73M**
* **2019 → $267M**
* **2020 → $678M**
* **2021 → $3.56B**

This indicates strong **market expansion and increasing demand**.

---

# Business Recommendations

Based on the analysis:

* Increase marketing investment in high-performing markets such as **India and the United States**
* Focus on expanding the **AQ BZ product line**
* Reduce dependency on a small group of customers by expanding the customer base
* Monitor revenue growth trends to identify emerging markets

---

# SQL Skills Demonstrated

This project demonstrates core SQL skills used by data analysts:

* Data exploration
* Multi-table joins
* Aggregations
* Subqueries
* Window functions
* CASE statements
* Revenue calculations
* Business performance analysis

---

# Tools Used

* SQL
* MySQL
* GitHub

---

# Project Structure

```
atliq-market-product-performance-analysis

README.md

sql_queries
   analysis_queries.sql

screenshots
```

---

# Author

**Priyanka**

 Data Analyst

Skills: SQL • Data Analysis • Business Intelligence
