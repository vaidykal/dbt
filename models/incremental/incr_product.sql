{{
    config(
    materialized='incremental',
    unique_key='src_product_id'
    ) 
}}

select * from PROD.src_product

/*The below macro checks if the configuration for this target table (incr_product) is incremental
It also checks that there is no Full Refresh set anywhere
Lastly it adds the below WHERE condition ONLY if the table referred by "this" incr_product DOES exist
Meaning need to get the max value of updated_at from the target table only if it exists

In order to insert older records that are late arrivals you can modify the WHERE condition as:
TO_DATE(updated_at)='2023-12-22'
assuming records dated 22nd Dec 2023 arrive late
and run this model

Add one more attribute incremental_strategy='delete+insert' in the config
To use delete followed by an insert instead of merge
*/
{% if is_incremental() %}
where
  updated_at > (select max(updated_at) from {{this}})
{% endif %}
