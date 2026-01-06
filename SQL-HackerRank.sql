===============================================================
Revising the Select Query I

SELECT * FROM CITY where population > 100000 and CountryCode  = 'USA';
===============================================================
Revising the Select Query II

SELECT NAME FROM CITY where population > 120000 and CountryCode = 'USA';
===============================================================
SELECT ALL

SELECT * FROM CITY;
===============================================================
SELECT using ID

SELECT * FROM CITY where ID = 1661;
===============================================================
Japanese Cities Attributes

SELECT * FROM CITY where COUNTRYCODE = 'JPN';
===============================================================
Japanese City Names

SELECT NAME FROM CITY where COUNTRYCODE = 'JPN';
===============================================================