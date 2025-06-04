-- Generate a yearly report for Croma India where there are two columns
-- 1. Fiscal Year
-- 2. Total Gross Sales amount In that year from Croma

-- Step-1 Find Croma India Customer Code

SELECT *
FROM dim_customer
WHERE customer like "%croma%" and market = "india";

-- Generate a yearly report for Croma India

SELECT g.fiscal_year,
	  sum(round(sold_quantity*g.gross_price,2)) as yearly_sales
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code = g.product_code and
get_fiscal_year(s.date) = g.fiscal_year
WHERE customer_code = 90002002
GROUP BY  g.fiscal_year
LIMIT 10000;