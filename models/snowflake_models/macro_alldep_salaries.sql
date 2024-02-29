{{ config(materialized='table') }}
select A.department_name,A.SALARY, dense_rank() over(order by salary desc) as rnk from (
{{alldepsalary()}}
) As A
qualify rnk < 3