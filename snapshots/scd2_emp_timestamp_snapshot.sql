{% snapshot emp_timestamp_snapshot %}

{{
    config(
      target_database='DBT_DB',
      target_schema='DBT_VKALPATHY',
      unique_key='employee_id',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from PROD.STG_EMP01

{% endsnapshot %}