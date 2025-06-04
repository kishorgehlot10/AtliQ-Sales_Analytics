-- customers’ forecast accuracy has dropped from 2020 to 2021.
-- Provide a complete report with these columns:
-- 1) customer_code,
-- 2) customer_name,
-- 3) market,
-- 4) forecast_accuracy_2020,
-- 5) forecast_accuracy_2021

with forecast_err_table_2021 as (
select 
       c.customer_code,
       c.customer,
       c.market,
       sum(e.sold_quantity) as total_sold_qty,
       sum(e.forecast_quantity) as total_forecast_qty,
       sum(e.forecast_quantity-e.sold_quantity) as net_err,
       round(sum(e.forecast_quantity-e.sold_quantity)*100/sum(e.forecast_quantity),2)  as net_err_pct,
       sum(abs(e.forecast_quantity-e.sold_quantity)) as abs_err,
       round(sum(abs(e.forecast_quantity-e.sold_quantity))*100/sum(e.forecast_quantity),2) as abs_err_pct
from fact_act_est e
join dim_customer c
on e.customer_code = c.customer_code
where fiscal_year = 2021
group by c.customer_code),

forecast_accuracy_table_2021 as (
select customer_code,
       customer,
       market,
       if(abs_err_pct > 100,0,100-abs_err_pct) as forecast_accuracy_2021
from forecast_err_table_2021),

forecast_err_table_2020 as (
select 
       c.customer_code,
       c.customer,
       c.market,
       sum(e.sold_quantity) as total_sold_qty,
       sum(e.forecast_quantity) as total_forecast_qty,
       sum(e.forecast_quantity-e.sold_quantity) as net_err,
       round(sum(e.forecast_quantity-e.sold_quantity)*100/sum(e.forecast_quantity),2)  as net_err_pct,
       sum(abs(e.forecast_quantity-e.sold_quantity)) as abs_err,
       round(sum(abs(e.forecast_quantity-e.sold_quantity))*100/sum(e.forecast_quantity),2) as abs_err_pct
from fact_act_est e
join dim_customer c
on e.customer_code = c.customer_code
where fiscal_year = 2020
group by c.customer_code),

forecast_accuracy_table_2020 as  (
select customer_code,
       customer,
       market,
       if(abs_err_pct > 100,0,100-abs_err_pct) as forecast_accuracy_2020
from forecast_err_table_2020)

select f.*,
       s.forecast_accuracy_2021,
       (f.forecast_accuracy_2020-s.forecast_accuracy_2021) as difference
from forecast_accuracy_table_2020 f
join forecast_accuracy_table_2021 s
on f.customer_code = s.customer_code
order by difference desc ;