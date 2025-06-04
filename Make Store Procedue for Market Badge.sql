-- Make Store Procdure for determine the market badge,
-- If Total Sold Qty > 5 Millions then market consider Gold else consider Silver.

select c.market,
	   sum(s.sold_quantity)
from fact_sales_monthly s
join dim_customer c
on s.customer_code = c.customer_code
where get_fiscal_year(s.date) = 2021 and c.market = "india"
group by c.market

-- Make Store Procedure 

DELIMITER $$

CREATE PROCEDURE `Get_Market_Badge`(
IN in_market VARCHAR(45),
IN in_fiscal_year YEAR,
OUT market_badge VARCHAR(45)
)
BEGIN
DECLARE qty INT DEFAULT 0;

SELECT
	sum(s.sold_quantity) into qty
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
WHERE get_fiscal_year(s.date) = in_fiscal_year and 
	  c.market = in_market
GROUP BY c.market;
IF qty > 5000000 THEN 
SET market_badge = "Gold";
ELSE 
SET market_badge = "Silver";
END IF;

END$$

DELIMITER ;
;