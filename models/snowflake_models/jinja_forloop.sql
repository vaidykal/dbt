{% set platforms=["Wii","X360","PS4"] %}

{% set totcount= platforms | length %}


select platform, count(1) as cnt_rows from DBT_DB.PROD.PRODUCT
where platform in (
{% for plt in platforms   %}

    {%- if loop.index==totcount -%}
        '{{plt}}'

    {%- else -%}
      
      '{{plt}}',

    {%- endif -%}


{% endfor %})
group by platform
