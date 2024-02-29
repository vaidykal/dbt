select A.department_name,A.SALARY as tot_sub_40K_salary from (
{{getdepsalary(4000000)}}
) As A
