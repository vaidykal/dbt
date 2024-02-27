with stores as (
select *
from {{ ref('store_sf') }}
),
store_sales as (
select *
from {{ ref('store_sales_sf') }}
),
store_sales_profit as (
    select s.s_store_name, s.s_country, sum(ss.ss_sales_price) as ss_sales_price, sum(ss.ss_net_profit) as ss_net_profit
    from stores as s, store_sales as ss
    where s.s_store_sk = ss.ss_store_sk
    group by 1,2
)
select * from store_sales_profit