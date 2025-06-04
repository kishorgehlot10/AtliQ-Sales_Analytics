-- An aggregated Monthly Gross Sales report for Croma India customer for how much sales this particular customer generating.
-- field required 1) Month ,
--                2) Total Gross sales Amount
-- Make Store Procedure by which generate Total Gross Sales Report of any Customer by entering Customer Code only.
            
-- Step-1 Find Croma India Customer Code

SELECT *
FROM dim_customer
WHERE customer like "%croma%" and market = "india";

-- Step-2 Create Monthly Gross Sales Report fo Croma India.

SELECT s.date,
       round(sum(g.gross_price*s.sold_quantity),2) as Total_Gross_Price
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code = g.product_code and
   get_fiscal_year(s.date) = g.fiscal_year
WHERE customer_code = 90002002
GROUP BY s.date
LIMIT 10000;

-- Step-3 Make a Store Procedure for using any Customer Code

DELIMITER $$

CREATE PROCEDURE `Get_Monthly_Sales_Report_by_Customer` (Cust_Code INT)
DETERMINISTIC
BEGIN
SELECT s.date,
       round(sum(g.gross_price*s.sold_quantity),2) as Total_Gross_Price
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code = g.product_code and
   get_fiscal_year(s.date) = g.fiscal_year
WHERE customer_code = Cust_Code
GROUP BY s.date
LIMIT 10000;
END $$



