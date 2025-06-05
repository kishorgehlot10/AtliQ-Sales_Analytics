# 🧠 Advanced SQL Sales Analysis Project – AtliQ Technologies

This project demonstrates real-world SQL techniques to analyze sales, forecasting accuracy, and market performance using a large-scale database from AtliQ Technologies – a global hardware manufacturing company. The project is designed to provide actionable business insights using SQL queries, views, stored procedures, and common table expressions (CTEs).

---

## 🏢 Company Overview

**AtliQ Technologies** is a multinational B2B hardware manufacturing company with a diverse product portfolio across multiple divisions:  
- **Divisions**: PCs, Notebooks, Storage Devices, Peripherals & Accessories (P&A), Network & Security (N&S)  
- **Product Categories**: Desktops, Keyboards, Mouse, Hard Disks, Notebooks, etc.

They operate on two major platforms:
- **Brick & Mortar** stores
- **E-commerce** platforms

Their sales channels include:
- **Direct** (AtliQ Exclusive Stores, AtliQ E-Store)
- **Retail** (Croma, Amazon, Flipkart, and other resellers)

They serve markets globally, including **India, the USA, Canada, and the UK**.

---

## 🧩 Problem Statement

As AtliQ rapidly scales across multiple geographies and sales channels, they face challenges such as:
- Inaccurate sales forecasts
- Difficulty tracking net revenue performance across channels
- Identifying top-performing customers, products, and regions

The objective of this project is to build SQL-based solutions to improve visibility into:
- Forecasting accuracy
- Sales performance trends
- Regional market dominance
- Customer profitability

---

## 🗃️ Database Schema Overview

The database used in this project contains over **1.42 million rows** and includes the following tables:

| Table Name                  | Description                                        |
|----------------------------|----------------------------------------------------|
| `dim_customer`             | Customer-level details (market, region, type)      |
| `dim_product`              | Product information (name, category, variant)      |
| `fact_sales_monthly`       | Actual sales data (quantity, date, customer)       |
| `fact_forecast_monthly`    | Monthly forecasted sales by customer & product     |
| `fact_gross_price`         | Product pricing data (by fiscal year)              |
| `fact_pre_invoice_deduction` | Discounts before invoicing                       |
| `fact_post_invoice_deduction` | Discounts after invoicing                      |
| `fact_act_est` *(derived)* | Merged actual vs forecast data for analysis        |

---

## 🎯 Analytical Objectives

- Generate gross and net sales reports
- Rank markets and customers by revenue
- Measure and compare forecast accuracy across years
- Identify top product and customer combinations
- Classify markets using stored procedures (Gold/Silver)
- Build reusable views and functions for business users

---

## 🛠️ SQL Techniques Used

- ✅ Common Table Expressions (CTEs)
- ✅ Window Functions (`RANK`, `SUM OVER`)
- ✅ User-Defined Functions
- ✅ Stored Procedures
- ✅ Views for Net Sales pipeline
- ✅ Aggregation and Grouping logic
- ✅ Fiscal Year transformation

---

## 📊 SQL Query Collection

| #  | Query Description                                                                  | Link to Query |
|----|-------------------------------------------------------------------------------------|---------------|
| 01 | ✅ Create `fact_act_est` table (Actual vs Estimated data)                          | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Create%20fact_act_est%20table.sql) |
| 02 | 📄 Create a View for Net Sales                                                     | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Create%20view%20for%20Net%20Sales..sql) |
| 03 | 📉 Customers’ forecast accuracy dropped from 2020 to 2021                          | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Customers%E2%80%99%20forecast%20accuracy%20has%20dropped%20from%202020%20to%202021..sql) |
| 04 | 🌍 Top 5 Markets using Common Table Expression (CTE)                               | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Find%20Top%205%20Market%20by%20using%20cte.sql) |
| 05 | 📆 Fiscal Yearly Gross Sales Report of Croma India                                 | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Fiscal%20yearly%20%20Gross%20Sales%20%20Report%20of%20Croma%20India.sql) |
| 06 | 🎯 Forecast Accuracy of All Customers in Fiscal Year 2021                          | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Get%20forecast%20accuracy%20of%20all%20customer%20in%20fiscal%20year%202021..sql) |
| 07 | 🛠️ Stored Procedure for Market Badge Assignment                                    | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Make%20Store%20Procedue%20for%20Market%20Badge.sql) |
| 08 | 📦 Monthly Aggregated Product-Wise Sales Report (FY 2021)                          | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Monthly%20Aggregated%20Product%20Wise%20%20Sales%20Report%20of%20Fiscal%20Year%202021%20with%20Total%20Gross%20Price%20of%20Croma%20India.sql) |
| 09 | 💰 Monthly Gross Sales Report of Croma India                                       | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Monthly%20Gross%20Sales%20%20Report%20of%20Croma%20India.sql) |
| 10 | 🏆 Top 2 Markets in Every Region by Gross Sales (FY 2021)                          | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Top%202%20Markets%20in%20every%20Region%20by%20their%20Gross%20Sales%20%20in%20FY%3D2021.sql) |
| 11 | 🔝 Top 5 Market-Customer Product Performers                                         | [🔎 Click Here](https://github.com/kishorgehlot10/AtliQ-Sales_Analytics/blob/main/Top%205%20%20Market%20Customer%20Products.sql) |


---

## 💡 Key Business Insights

📌 Based on the analysis, the following insights were derived:

- 📉 Forecast accuracy dropped significantly for some customers between 2020 and 2021.
- 🏆 Top markets like India and the USA dominate over 60% of net sales in FY 2021.
- 💼 Market badge logic helps in classifying focus markets (Gold if sold quantity > 5M).
- 🛒 Croma India consistently ranks among the top contributors by gross and net sales.
- 🌍 Region-wise analysis reveals top-performing markets for resource allocation.

---

🙋‍♂️ About Me
I'm a passionate data analyst skilled in SQL, Excel, Power BI, and business storytelling.
Connect with me on LinkedIn (https://www.linkedin.com/in/kishorkumargehlot/)| GitHub(https://github.com/kishorgehlot10)

⭐ If you found this project useful, feel free to give it a ⭐ star and share your thoughts!









