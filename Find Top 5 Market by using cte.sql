-- Find Top Market by Net sales by using CTE

-- Step-1 Create a CTE for gross_sales.

WITH gross_sales as (
SELECT s.date, 
	   s.fiscal_year,
       c.customer_code,
       c.customer,
       c.market,
       p.product_code,
       p.product,
       p.variant,
       s.sold_quantity,
       g.gross_price,
       round(g.gross_price*s.sold_quantity,2) as gross_price_total
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
JOIN dim_product p
ON s.product_code = p.product_code
JOIN fact_gross_price g
ON s.product_code = g.product_code and
   s.fiscal_year = g.fiscal_year),
   
-- Step-2 Create a CTE for net invoice sales.

net_invoice_sales as (
SELECT g.date, 
	   g.fiscal_year,
       g.customer_code,
       g.customer,
       g.market,
       g.product_code,
       g.product,
       g.variant,
       g.sold_quantity,
       g.gross_price,
       g.gross_price_total,
       pre_invoice_discount_pct,
       (1-pre.pre_invoice_discount_pct)*gross_price_total as net_invoice_sales
FROM gross_sales g
JOIN fact_pre_invoice_deductions pre
ON g.customer_code = pre.customer_code and
g.fiscal_year = pre.fiscal_year),
   
-- Step-3 Create a CTE for net sales.

net_sales as (
SELECT net.date, 
	   net.fiscal_year,
       net.customer_code,
       net.customer,
       net.market,
       net.product_code,
       net.product,
       net.variant,
       net.sold_quantity,
       net.gross_price,
       net.gross_price_total,
       net.pre_invoice_discount_pct,
       net.net_invoice_sales,
       post.post_invoice_discount_pct,
       (1-post.post_invoice_discount_pct)*net.net_invoice_sales as net_sales
FROM net_invoice_sales net
JOIN fact_post_invoice_deductions post
ON net.customer_code = post.customer_code and
net.product_code = post.product_code and
net.date = post.date)

-- Step-4 Find Top Market by Net sales using Net_sales CTE.

SELECT market,
	   round(sum(net_sales)/1000000,2) as Net_sales_mln
FROM net_sales
WHERE fiscal_year = 2021
GROUP BY market
ORDER BY net_sales_mln DESC
LIMIT 5;
