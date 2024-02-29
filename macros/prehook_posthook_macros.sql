{% macro update_model_params() %}

{% set model_param_query %}
select 1 from prod.model_param where model_name = '{{ this }}'
{% endset %}

{% set results = run_query(model_param_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{% set totcount= results_list | length %}

{% if totcount>0 %}

update PROD.Model_Param
set rundate = current_timestamp
where model_name = '{{ this }}'

{% else %}

insert into PROD.Model_Param values (1, '{{this}}', current_timestamp);


{% endif %}

{% endmacro %}


{% macro insert_into_dbtlogs() %}
insert into Prod.dbt_logs(Model_Name,Schema_Name,Database_Name,CREATED_TS) 
VALUES('{{ this }}','{{ this.schema}}','{{this.database}}',current_timestamp)
{% endmacro %}