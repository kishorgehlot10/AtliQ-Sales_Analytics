-- Find Top Customer by Net sales 

SELECT customer,
	   round(sum(net_sales)/1000000,2) as Net_sales_mln
FROM net_sales
WHERE fiscal_year = 2021
GROUP BY customer
ORDER BY net_sales_mln DESC
LIMIT 5;

-- Find Top Product by Net sales 

SELECT product,
	   round(sum(net_sales)/1000000,2) as Net_sales_mln
FROM net_sales
WHERE fiscal_year = 2021
GROUP BY product
ORDER BY net_sales_mln DESC
LIMIT 5;

-- Top 10 customer performance as Net Sales Globall Market %

WITH CTE1 AS (
SELECT customer,
	   round(sum(net_sales)/1000000,2) as Net_sales_mln
FROM net_sales n
WHERE fiscal_year = 2021 
GROUP BY customer
ORDER BY net_sales_mln DESC)

SELECT *,
	net_sales_mln*100/sum(net_sales_mln) over() as  market_share_pct
FROM CTE1;

-- Top 10 customer performance as Net Sales per region Market %

WITH CTE1 AS (
SELECT n.customer,
	   round(sum(net_sales)/1000000,2) as Net_sales_mln
FROM net_sales n
join dim_customer c
on n.customer_code = c.customer_code
WHERE n.fiscal_year = 2021 and c.region = "apac"
GROUP BY customer
ORDER BY net_sales_mln DESC)

SELECT *,
	net_sales_mln*100/sum(net_sales_mln) over() as  market_share_pct_in_apac
FROM CTE1;