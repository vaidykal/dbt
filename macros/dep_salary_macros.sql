{% macro getdepsalary(salval,depname='IT') %}
select d.department_name,sum(e.salary) As SALARY from Prod.employee e inner join Prod.DEPARTMENT d
on e.department_id=d.department_id
where department_name = '{{depname}}' 
and SALARY < {{salval}}
group by 1
{% endmacro %}

{% macro alldepsalary() %}
select d.department_name,sum(e.salary) As SALARY from Prod.employee e inner join Prod.DEPARTMENT d
on e.department_id=d.department_id
group by 1
{% endmacro %}
