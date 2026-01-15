===============================================================
13 - Best Employee Award

WITH cte AS (
    SELECT 
        employee_name,
        DATE_FORMAT(project_completion_date, '%Y%m') AS yearmonth,
        COUNT(project_id) AS no_of_completed_projects
    FROM projects
    GROUP BY 
        employee_name,
        DATE_FORMAT(project_completion_date, '%Y%m')
),
cte2 AS (
    SELECT 
        employee_name,
        yearmonth,
        no_of_completed_projects,
        RANK() OVER (
            PARTITION BY yearmonth 
            ORDER BY no_of_completed_projects DESC
        ) AS rnk
    FROM cte
)
SELECT 
    employee_name,
    no_of_completed_projects,
    yearmonth
FROM cte2
WHERE rnk = 1
ORDER BY no_of_completed_projects DESC , employee_name DESC;
===============================================================
29 - Software vs Data Analytics Engineers

with cte as (
SELECT *
, case when JobTitle like 'Software%' Then 'Software Engineers'
when JobTitle like 'Data%' Then 'Data Professionals'
when JobTitle like '%Manager%' Then 'Managers'
end as emp_group
FROM employees
)
, cte1 as (
select emp_group,count(*) as cnt
from cte
group by emp_group
)
select 
sum(case when emp_group='Software Engineers' then cnt end) as Software_Engineers,
sum(case when emp_group='Data Professionals' then cnt end) as Data_Professionals,
sum(case when emp_group='Managers' then cnt end) as Managers
from cte1

===============================================================