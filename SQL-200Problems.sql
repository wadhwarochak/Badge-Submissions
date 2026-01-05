
===============================================================
38 - Product Reviews

select * from product_reviews
where (lower(review_text) LIKE '%excellent%'
OR lower(review_text) LIKE '%amazing%')
AND lower(review_text) NOT LIKE '%not excellent%'
AND lower(review_text) NOT LIKE '%not amazing%'
order by review_id;
===============================================================
105 - Student Major Subject

select student_id, course_id from student_courses
where major_flag  = 'Y'
OR student_id IN (SELECT student_id from student_courses GROUP BY student_id having count(course_id) = 1);
===============================================================
102 - Users With Valid Passwords

select user_id,user_name  from user_passwords
where length(password)>=8
and password REGEXP '[A-Za-z]'
and password REGEXP '[0-9]'
and password REGEXP '[@#$%^&*]'
and password NOT LIKE '% %';

===============================================================
103 - Employee Mentor

SELECT name from employees where mentor_id !=3 or mentor_id is null;
===============================================================
95 - Electronics Items Sale

SELECT category, round(AVG(price),2) as average_price
from electronic_items
where warranty_months >=12
group by category
having average_price > 500 and sum(quantity)>=20
order by average_price desc;

===============================================================
106 - Subject Average Score

SELECT course_name, avg(score) as avg_score from students
where student_id IN (SELECT student_id from students where score < 70) group by course_name having avg_score > 70 order by avg_score desc;




===============================================================
6 - Electricity Consumption

SELECT household_id, left(billing_period, 4) as bill_year, sum(consumption_kwh) as consumption_kwh, sum(total_cost) as total_cost, avg(consumption_kwh) as avg_consumption_kwh from electricity_bill group by household_id, left(billing_period, 4)
order by household_id, bill_year;
===============================================================
12 - Deliveroo Top Customer

select customer_id, sum(total_cost) as total_expense from orders group by customer_id order by total_expense DESC LIMIT 1;
===============================================================
61 - Category Sales (Part 1)

select category, sum(amount) as total_sales from sales
WHERE YEAR(order_date)=2022
AND MONTH(order_date)=2
AND DAYOFWEEK(order_date) BETWEEN 2 and 6
group by category order by total_sales;
===============================================================
71 - Department Average Salary

SELECT d.department_name, round(avg(salary),2) as average_salary 
FROM employees e
inner join departments d on e.department_id = d.department_id
group by d.department_name
having count(*)>2
order by average_salary desc;
===============================================================
72 - Product Sales


SELECT p.product_name, sum(s.quantity *p.price) as total_sales_amount
FROM sales s

INNER JOIN products p
    ON p.product_id = s.product_id
group by p.product_name
order by p.product_name;
===============================================================
1 - Return Orders Customer Feedback

select o.customer_name,
round(count(r.order_id)*100/count(*),2) as return_percent from orders o
left join returns r on o.order_id=r.order_id
group by o.customer_name
having return_percent > 50;
===============================================================
3 - LinkedIn Top Voice

select
	c.creator_name,
	count(*) as no_of_posts,
	sum(p.impressions) as total_impressions
from
	creators c
inner join
	posts p on c.creator_id=p.creator_id
where
	c.followers > 50000
	and year(p.publish_date)=2023 and month(p.publish_date)=12
group by c.creator_name
having sum(p.impressions)>100000 and count(*)>=3
ORDER BY total_impressions DESC;
===============================================================
4 - Premium Customers

select customer_name, count(*) as no_of_orders
from orders
group by customer_name
having count(*) > (select count(*)/count(distinct customer_name) as avg_orders from orders)
ORDER BY no_of_orders DESC;
===============================================================
94 - GAP Sales

select store_id,category, sum(total_sales) as total_sales from gap_sales
where year(sale_date)=2023 and MONTH(sale_date) in (4,5,6)
group by category, store_id
order by total_sales asc;
===============================================================
2 - Product Category

with cte as (select product_id, product_name, price,
	case
		when price < 100 then 'Low Price'
		when price between 100 and 500 then 'Medium Price'
		else 'High Price'
	end as category
from products
)

select category, count(*) as no_of_products 
from cte
group by category
ORDER BY no_of_products DESC;
===============================================================
8 - Library Borrowing Habits

with cte as (
select br.BorrowerName, b.BookName from Books b
inner join Borrowers br on b.bookid=br.bookid
)
select BorrowerName, group_concat(BookName order by BookName) as booklist from cte
group by br.BorrowerName
===============================================================
11 - Math Champions


select s.student_name, g.grade as math_grade from Students s inner join Grades g
On s.student_id=g.student_id where subject = 'Math' and
grade > (select avg(g.grade) from Grades g where subject='Math') order by math_grade;
===============================================================
30 - Employee Salary Levels

with CTE1 as(select e.employee_id, e.employee_name, e.salary,
CASE
	WHEN e.salary < 50000 THEN "Low"
	WHEN e.salary between 50000 and 100000 then "Medium"
	WHEN e.salary > 100000 then "High"
END AS Salary_Level
from employees e)

SELECT Salary_Level, round(avg(salary),0) as avg_salary FROM CTE1 group by Salary_Level order by Salary_Level;

===============================================================
62 - Category Sales (Part 2)
with cte1 as (select s.amount, s.category_id, s.sale_date, s.sale_id, c.category_name from categories c left join sales s
on c.category_id = s.category_id)

select category_name, COALESCE(sum(amount),0) as total_sales from cte1 group by category_name order by total_sales;
===============================================================
7 - Airbnb Top Hosts


WITH cte AS (  
    SELECT host_id, listing_id  
        , COUNT(*) OVER(PARTITION BY host_id) AS cnt_listings      --  Count listings per host using window function  
    FROM listings  
)  
SELECT cte.host_id, cte.cnt_listings AS no_of_listings  
    , ROUND(AVG(r.rating), 2) AS avg_rating                        --  Calculate average rating rounded to 2 decimals  
FROM cte  
INNER JOIN reviews r ON cte.listing_id = r.listing_id             --  Join with reviews on listing_id  
WHERE cte.cnt_listings >= 2                                        --  Filter hosts with 2 or more listings  
GROUP BY cte.host_id, cte.cnt_listings                             --  Group by host_id and listing count  
ORDER BY avg_rating DESC                                           --  Order by average rating descending  
LIMIT 2;                                                          --  Limit to top 2 hosts  
===============================================================
17 - Business Expansion

with cte as (select city_id, year(min(business_date)) as year_opening from business_operations group by city_id)

select year_opening as first_operation_year, count(*) as no_of_new_cities from cte group by year_opening;
===============================================================