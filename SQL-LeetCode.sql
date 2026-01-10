===============================================================
1757. Recyclable and Low Fat Products

SELECT product_id from Products where low_fats='Y' and recyclable='Y';
===============================================================
584. Find Customer Referee

SELECT name from Customer where referee_id !=2 or referee_id is NULL;
SELECT name from Customer where IFNULL(referee_id,0) !=2;
===============================================================
595. Big Countries

select name, population, area from World where area >=3000000   or population  >=25000000;


select name, population, area from World where area >=3000000 
UNION
select name, population, area from World where population  >=25000000;
===============================================================
1148. Article Views I

select distinct author_id as id
from Views where author_id = viewer_id
order by id
===============================================================
1683. Invalid Tweets

SELECT tweet_id  from Tweets
where char_length(content) > 15
===============================================================
1378. Replace Employee ID With The Unique Identifier

SELECT eu.unique_id, e.name
from  Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;
===============================================================
1068. Product Sales Analysis I

SELECT p.product_name, s.year, s.price
from Sales s
LEFT JOIN Product p
USING(product_id);

===============================================================
1581. Customer Who Visited but Did Not Make Any Transactions

SELECT v.customer_id, COUNT(customer_id) as count_no_trans
FROM Visits v
LEFT JOIN Transactions t
on v.visit_id = t.visit_id
WHERE t.transaction_id is NULL
GROUP BY v.customer_id
===============================================================
197. Rising Temperature

SELECT w1.id
FROM weather w1 INNER JOIN Weather w2
WHERE DATEDIFF(w1.recordDate,w2.recordDate) = 1
AND w1.temperature > w2.temperature;


SELECT w1.id
FROM weather w1 INNER JOIN Weather w2
ON DATEDIFF(w1.recordDate,w2.recordDate) = 1
AND w1.temperature > w2.temperature;

SELECT w1.id
FROM weather w1 INNER JOIN Weather w2
WHERE SUBDATE(w2.recordDate,1) = w2.recordDate
AND w1.temperature > w2.temperature;
===============================================================
===============================================================