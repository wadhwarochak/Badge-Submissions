===============================================================
24 - Account Balance

WITH cte AS (
    -- Money sent (debit)
    SELECT 
        from_userid AS user_id,
        -1 * amount AS amount
    FROM transactions

    UNION ALL

    -- Money received (credit)
    SELECT 
        to_userid AS user_id,
        amount
    FROM transactions

    UNION ALL

    -- Opening balance
    SELECT 
        user_id,
        opening_balance AS amount
    FROM users
)

SELECT 
    u.username,
    SUM(amount) AS final_amount
FROM cte c inner join users u on u.user_id = c.user_id
GROUP BY u.username
order by final_amount;

===============================================================
27 - Income Tax Returns

with all_user_years as (select u.user_id, it.financial_year, it.file_due_date from users u cross join income_tax_dates it
group by u.user_id, it.financial_year, it.file_due_date)

select a.user_id, a.financial_year,
CASE
	WHEN u.return_file_date > a.file_due_date
	then 'late return'
	else
	'missed'
END as comment
from all_user_years a
LEFT JOIN users u
ON a.user_id = u.user_id and a.financial_year=u.financial_year
where u.return_file_date> a.file_due_date
or u.return_file_date IS NULL
order by a.financial_year;
===============================================================
13 - Best Employee Award

with cte as (select
	 employee_name,
	 DATE_FORMAT(project_completion_date, '%Y%m') AS yearmonth,
	 count(project_id) as no_of_completed_projects
	 from projects
	group by employee_name, yearmonth),
	
cte2 as(
	SELECT employee_name,
	yearmonth,
	no_of_completed_projects,
	RANK() OVER(
		PARTITION BY yearmonth
		ORDER BY no_of_completed_projects DESC
	) as rnk
	FROM cte
)

SELECT employee_name, no_of_completed_projects, yearmonth
FROM cte2
WHERE rnk=1
ORDER BY no_of_completed_projects desc,employee_name desc
===============================================================
;