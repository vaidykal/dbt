{{ config(materialized='view') }}

with employee_top3 as (select * from {{ref('employee_top3_ephemeral')}})
select * from employee_top3