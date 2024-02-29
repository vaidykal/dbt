{% snapshot emp_check_snapshot %}

{{
    config(
      target_database='DBT_DB',
      target_schema='DBT_VKALPATHY',
      unique_key='employee_id',

      strategy='check',
      check_cols=['employee_name','State']
    )
}}

select * from PROD.STG_EMP02

{% endsnapshot %}