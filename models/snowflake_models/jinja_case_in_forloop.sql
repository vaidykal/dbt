{% set regions=["West","South","Central"] %}

{% set totcount= regions | length %}

select sum(global_sales) as total_sales,
{% for rgn in regions   %}
    sum(case when region='{{rgn}}' then global_sales else 0 end) as {{rgn}}_sales
    {%- if loop.index<totcount -%}
       ,
    {%- endif -%}
{% endfor %}
from DBT_DB.PROD.PRODUCT
