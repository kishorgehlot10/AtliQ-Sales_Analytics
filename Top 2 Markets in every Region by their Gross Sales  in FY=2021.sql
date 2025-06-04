-- Retrieve the top 2 markets in every region by their gross sales amount in FY=2021
-- which contain column market,region,gross_sales,rnk

WITH cte as  (
SELECT g.market,
	   c.region,
       round(sum(g.gross_price_total)/1000000,2) as gross_sales_mln
FROM gross_sales g
JOIN dim_customer c
ON g.customer_code = c.customer_code
WHERE fiscal_year = 2021
GROUP BY  g.market,c.region),

cte2 as  (
SELECT *,
RANK() OVER(PARTITION BY region ORDER BY gross_sales_mln DESC) as rnk
FROM cte)

SELECT *
FROM cte2
WHERE rnk <=2