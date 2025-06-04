-- Generate a report of individual product sales (aggregated monthly basis) for croma india customer for fiscal year 2021 
-- Report should have Month,
				   -- Product Name,
                   -- Variant,
				   -- Sold Qty,
                   -- Gross Price per Item,
			       -- Gross Price Total

-- Step 1 Find Croma code 

SELECT *
FROM dim_customer
WHERE customer like "%croma%" and market = "india";


-- Step 2 Find croma sales in fiscal year 2021

SELECT *
FROM fact_sales_monthly 
WHERE customer_code = 90002002 and year(date_add(date,interval 4 month)) = 2021;

-- Create User Defined Function for fiscal_year

DELIMITER $$
CREATE FUNCTION `get_fiscal_year`(calender_date date) 
RETURNS int

DETERMINISTIC
BEGIN

DECLARE fiscal_year int;
SET fiscal_year = year(date_add(calender_date,interval 4 month));
RETURN fiscal_year;

END $$
DELIMITER 

-- Step 4 Find croma sales in fiscal year 2021 by using function get_fiscal_year

SELECT *
FROM fact_sales_monthly 
WHERE customer_code = 90002002 and get_fiscal_year(date) = 2021 AND get_fiscal_quater(DATE) = "Q4"
ORDER BY date
LIMIT 10000;

-- Step 5 Perform joins with dim_product and fact_gross_price and generating total_gross_price and another required fields.

SELECT 	s.date,
		s.product_code,
		p.product,
        p.variant,
        s.sold_quantity,
        g.gross_price,
        round((s.sold_quantity*g.gross_price),2) as total_gross_price
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
JOIN fact_gross_price g
ON s.product_code = g.product_code and g.fiscal_year = get_fiscal_year(s.date)
WHERE customer_code = 90002002 and get_fiscal_year(date) = 2021
ORDER BY date
LIMIT 10000;
