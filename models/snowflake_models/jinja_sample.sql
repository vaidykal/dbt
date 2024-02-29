{%-set var1='India'-%}
Value in variable is: {{var1}}


{%-set cntryList=['India','US','UK','France']-%}

{% for cntr in cntryList %}
Name of country is:{{cntr}}
{%- endfor -%}

