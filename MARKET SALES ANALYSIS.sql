create database MarketSales;

use MarketSales;

select * from supermarket_sales;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Total Sales 

SELECT ROUND(SUM(Total),2) AS TotalSales FROM supermarket_sales;

-- AVERAGE Sales 

SELECT ROUND(AVG(Total),2) AS AVGSales FROM supermarket_sales;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SALES BY CITY

-- TOTAL

SELECT CITY,ROUND(SUM(Total),2) AS TotalSales FROM supermarket_sales
GROUP BY CITY;

-- AVG

SELECT CITY,ROUND(AVG(Total),2) AS TotalSales FROM supermarket_sales
GROUP BY CITY;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SALES BY BRANCH

-- TOTAL
SELECT BRANCH,ROUND(SUM(Total),2) AS TotalSales FROM supermarket_sales
GROUP BY BRANCH
ORDER BY BRANCH ASC;
-- AVG
SELECT BRANCH,ROUND(AVG(Total),2) AS TotalSales FROM supermarket_sales
GROUP BY BRANCH
ORDER BY BRANCH ASC;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SALES BY MONTH 

SELECT MONTHNAME(DATE) AS MONTH, ROUND(SUM(Total), 2) AS TotalSales
FROM supermarket_sales
GROUP BY MONTHNAME(DATE)
ORDER BY MONTHNAME(DATE);
-- MONTH NAME = NULL

-- CHECKING DATE DATA TYPE

SHOW COLUMNS FROM supermarket_sales;

-- CHANGING DATE DATA TYPE

SET SESSION  sql_safe_updates = 0;

UPDATE supermarket_sales
SET Date = STR_TO_DATE(Date, '%m/%d/%Y')
WHERE Date LIKE '%/%/%' AND STR_TO_DATE(Date, '%m/%d/%Y') IS NOT NULL;

-- AFTER CHANGING DATE DATA TYPE

-- TOTAL
SELECT MONTHNAME(DATE) AS MONTH, ROUND(SUM(Total), 2) AS TotalSales
FROM supermarket_sales
GROUP BY MONTHNAME(DATE)
ORDER BY MONTHNAME(DATE);

-- AVG
SELECT MONTHNAME(DATE) AS MONTH, ROUND(AVG(Total), 2) AS TotalSales
FROM supermarket_sales
GROUP BY MONTHNAME(DATE)
ORDER BY MONTHNAME(DATE);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SALES BY Customer Type

-- TOTAL
SELECT Customer_type, COUNT(Customer_type) AS CountType, ROUND(SUM(Total), 2) AS TotalSales
FROM supermarket_sales
GROUP BY Customer_type;

-- AVG
SELECT Customer_type, ROUND(AVG(Total), 2) AS AVGSales
FROM supermarket_sales
GROUP BY Customer_type;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SALES BY PAYEMENT METHOD

-- TOTAL
SELECT Payment, COUNT(Payment) AS CountPaymentMethod, ROUND(SUM(Total), 2) AS TotalSales
FROM supermarket_sales
GROUP BY Payment
ORDER BY ROUND(SUM(Total), 2) DESC;

-- AVG
SELECT Payment, ROUND(AVG(Total), 2) AS AVGSales
FROM supermarket_sales
GROUP BY Payment
ORDER BY ROUND(AVG(Total), 2) DESC;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SALES BY PRODUCT TYPE

-- TOTAL
SELECT Product_line, ROUND(SUM(Total), 2) AS TOTALSales
FROM supermarket_sales
GROUP BY Product_line
ORDER BY ROUND(SUM(Total), 2) DESC;

-- AVG
SELECT Product_line, ROUND(AVG(Total), 2) AS AVGSales
FROM supermarket_sales
GROUP BY Product_line
ORDER BY ROUND(AVG(Total), 2) DESC;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SALES BY GENDER

-- TOTAL
SELECT GENDER, ROUND(SUM(Total), 2) AS TOTALSales
FROM supermarket_sales
GROUP BY GENDER
ORDER BY ROUND(SUM(Total), 2) DESC;

-- AVG
SELECT GENDER, ROUND(AVG(Total), 2) AS AVGSales
FROM supermarket_sales
GROUP BY GENDER
ORDER BY ROUND(AVG(Total), 2) DESC;

