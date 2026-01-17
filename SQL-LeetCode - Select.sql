===============================================================
1757. Recyclable and Low Fat Products

SELECT product_id FROM Products WHERE low_fats = 'Y'and recyclable = 'Y';
===============================================================
584. Find Customer Referee

SELECT name FROM Customer
WHERE referee_id is NULL or referee_id != 2

SELECT name FROM Customer
WHERE IFNULL(referee_id,0) <>2
===============================================================
===============================================================
===============================================================
===============================================================
