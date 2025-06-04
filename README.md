# 🧠 AtliQ Technologies Sales Analysis using SQL

Welcome to my advanced SQL project built using AtliQ Technologies' database. This project dives deep into business insights like sales trends, forecast accuracy, market performance, and more—powered by over **1.42 million records** across multiple tables!

💼 AtliQ Technologies is a fictional B2B tech hardware company that sells products like PCs, storage devices, and accessories across global markets.

---

## 🗂️ Dataset Overview

The analysis is based on the following core tables:

| Table Name                | Description                                           |
|---------------------------|-------------------------------------------------------|
| `dim_customer`            | Customer details including market and region         |
| `dim_product`             | Product master data                                  |
| `fact_sales_monthly`     | Actual sales quantity and revenue by month           |
| `fact_forecast_monthly`  | Forecasted demand for each product-customer combo    |
| `fact_gross_price`       | Gross price per product                              |
| `fact_pre_invoice_deduction` | Deductions applied before invoicing              |

---

## 📌 Project Objectives

- Assess customer forecast accuracy
- Analyze market-level performance using CTEs
- Create stored procedures for business logic
- Develop fiscal and monthly sales reports
- Provide actionable KPIs for business strategy

---

## 📊 SQL Query Collection

| #  | Query Description                                                                  | Link to Query |
|----|-------------------------------------------------------------------------------------|---------------|
| 01 | ✅ Create `fact_act_est` table (Actual vs Estimated data)                          | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Create%20fact_act_est%20table.sql) |
| 02 | 📄 Create a View for Net Sales                                                     | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Create%20view%20for%20Net%20Sales..sql) |
| 03 | 📉 Customers’ forecast accuracy dropped from 2020 to 2021                          | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Customers%E2%80%99%20forecast%20accuracy%20has%20dropped%20from%202020%20to%202021..sql) |
| 04 | 🌍 Top 5 Markets using Common Table Expression (CTE)                               | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Find%20Top%205%20Market%20by%20using%20cte.sql) |
| 05 | 📆 Fiscal Yearly Gross Sales Report of Croma India                                 | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Fiscal%20yearly%20%20Gross%20Sales%20%20Report%20of%20Croma%20India.sql) |
| 06 | 🎯 Forecast Accuracy of All Customers in Fiscal Year 2021                          | [🔎 Click Here](queries/06_fy2021_forecast_accuracy.sql) |
| 07 | 🛠️ Stored Procedure for Market Badge Assignment                                    | [🔎 Click Here](queries/07_sp_market_badge.sql) |
| 08 | 📦 Monthly Aggregated Product-Wise Sales Report (FY 2021)                          | [🔎 Click Here](queries/08_monthly_agg_product_sales.sql) |
| 09 | 💰 Monthly Gross Sales Report of Croma India                                       | [🔎 Click Here](queries/09_monthly_gross_sales_report.sql) |
| 10 | 🏆 Top 2 Markets in Every Region by Gross Sales (FY 2021)                          | [🔎 Click Here](queries/10_top2_market_per_region.sql) |
| 11 | 🔝 Top 5 Market-Customer Product Performers                                         | [🔎 Click Here](queries/11_top5_market_customer_products.sql) |

> 📁 All `.sql` files are located in the [`queries`](./queries/) folder.

---

## ⚙️ Tools Used

- **MySQL 8.0**
- **MySQL Workbench**
- **Git & GitHub**
- **SQL CTEs, Views, Stored Procedures**

---

## 💡 Sample Business Insight

> 🧾 “Customers’ forecast accuracy dropped by 8.4% from FY 2020 to FY 2021, especially in emerging markets. This indicates the need to re-align the forecasting model or improve communication between the sales and forecasting teams.”

---

## 🚀 How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/atliq-sales-analysis-sql.git
   cd atliq-sales-analysis-sql
