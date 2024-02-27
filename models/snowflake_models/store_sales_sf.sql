{{ config(materialized='view') }}

/*
with store_sales_tbl_sf as (select ss_store_sk, ss_quantity, ss_sales_price, ss_net_profit from DBT_DB.PROD.STORE_SALES_SF)
select * from store_sales_tbl_sf
*/

with store_sales_tbl_sf as (select ss_store_sk, ss_quantity, ss_sales_price, ss_net_profit from {{ source('sf_prod', 'STORE_SALES_SF') }})
select * from store_sales_tbl_sf
