===============================================================
595. Big Countries

select name, population, area from World where area >=3000000   or population  >=25000000;

select name, population, area from World where area >=3000000 
UNION
select name, population, area from World where population  >=25000000;
===============================================================
1757. Recyclable and Low Fat Products

SELECT product_id from Products where low_fats = 'Y' and recyclable  = 'Y';
===============================================================
584. Find Customer Referee

SELECT name from Customer where referee_id !=2 or referee_id is null;

SELECT name from Customer where IFNULL(referee_id,0) <> 2
===============================================================
1148. Article Views I

select distinct author_id as id
from Views where author_id = viewer_id
order by id
===============================================================
1378. Replace Employee ID With The Unique Identifier

SELECT eu.unique_id, e.name
from  Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;
===============================================================
1683. Invalid Tweets

SELECT tweet_id  from Tweets
where char_length(content) > 15
===============================================================
1068. Product Sales Analysis I

SELECT p.product_name, s.year, s.price
from Sales s
LEFT JOIN Product p
ON s.product_id = p.product_id;

SELECT p.product_name, s.year, s.price
from Sales s
LEFT JOIN Product p
USING(product_id);
===============================================================