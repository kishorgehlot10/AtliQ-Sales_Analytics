-- Get forecast accuracy of all customer in fiscal year 2021.

with forecast_err_table as (
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
group by customer_code)

select *,
       if(abs_err_pct > 100,0,100-abs_err_pct) as forecast_accuracy
from forecast_err_table
order by forecast_accuracy desc
