{{ config(materialized='table') }}

with product_sales as (
select city, state, sum(na_sales), sum(global_sales)
from dbt_db.prod.product
group by 1,2
)
select * from product_sales