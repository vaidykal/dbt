{{ config(materialized='view') }}

with store_tbl_sf as (select s_store_sk, s_store_id, s_store_name, s_country, s_county from DBT_DB.PROD.STORE_SF)
select * from store_tbl_sf