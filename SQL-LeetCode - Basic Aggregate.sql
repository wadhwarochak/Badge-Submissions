===============================================================
620. Not Boring Movies

SELECT *
FROM Cinema
WHERE id%2 !=0 AND description != 'boring'
ORDER BY rating DESC;
===============================================================
1075. Project Employees I

select project_id,
  round(sum(e.experience_years)/count(*),2) as average_years
from Project p
JOIN  Employee e
On p.employee_id = e.employee_id
group by p.project_id
===============================================================
===============================================================
===============================================================
===============================================================
