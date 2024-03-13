-- PROJECT - EDA OF SUPERMARKET
SHOW DATABASES;
-- we use eda_supermarket database for EDA
USE eda_supermarket;
SHOW TABLES;

-- 1. Display the first 5 rows.

SELECT * FROM supermarket LIMIT 5;

-- 2. Display the last 5 rows.

SELECT * FROM supermarket ORDER BY 'Invoice ID' DESC LIMIT 5;

-- 3. Display random 5 rows from dataset.

SELECT * FROM supermarket ORDER BY rand() LIMIT 5;

-- 4. Display count, min, max, avg, and std values for gross income

SELECT count('gross income'),
min('gross income'),
max('gross income'),
avg('gross income'),
std('gross income')
FROM supermarket;

-- 5. Find the number of missing values in branch column

SELECT COUNT(*) FROM supermarket WHERE Branch IS NULL;

-- 6. Count the number of occurrences of each city

SELECT city, count(city) AS number_of_occurrence FROM supermarket
GROUP BY city;

-- 7. Find the most frequenty used payment method

SELECT payment, count(*) FROM supermarket GROUP BY payment;

SELECT rating, cogs FROM supermarket;

-- 8. Dose the cost of good(cogs) sold affect the rating?

SELECT rating, cogs FROM supermarket;

-- 9. Find most profitable branch as per gross income

SELECT Branch, ROUND(SUM(`gross income`), 2) AS total_gross_income
FROM supermarket
GROUP BY Branch
ORDER BY total_gross_income DESC;

-- 10. Find most use payment method city-wise

SELECT city, Payment , COUNT(*) AS num_transactions
FROM supermarket
GROUP BY city, Payment
ORDER BY city, num_transactions DESC;

-- BY USING CASE

SELECT city,
SUM(CASE WHEN payment ='cash' THEN 1 ELSE 0 END) AS  'CASH',
SUM(CASE WHEN payment = 'Ewallet' THEN 1 ELSE 0 END) AS 'Ewallet',
SUM(CASE WHEN payment = 'Credit card' THEN 1 ELSE 0 END) AS 'Credit card'
FROM supermarket
GROUP BY city;

-- 11. find product line purchased in the highest quantity

SELECT 'product line' , SUM(Quantity) FROM supermarket
GROUP BY 'product line'
ORDER BY SUM(Quantity) DESC;

-- 12. Display the daily sales by day of the week.
SELECT * FROM supermarket;

SET SQL_SAFE_UPDATES = 0;

UPDATE supermarket 
SET date = str_to_date(Date, '%m/%d/%Y');

SELECT * FROM supermarket;

SELECT dayname(date), dayofweek(date), sum(Total)
FROM supermarket
GROUP BY dayname(date), dayofweek(date);


-- 13. find the month which the highest sale?

SELECT monthname(date) AS month_name, month(date) AS months,
sum(Total) as total FROM supermarket
GROUP BY month_name, months ORDER BY Total DESC;

-- 14. find the time at which sales are highest

SELECT * FROM supermarket;
SELECT hour(time) as hour, sum(total) as total
FROM supermarket GROUP BY hour
ORDER BY total DESC;

-- 15. which gender spend more on avarage ?

SELECT gender, AVG(`gross income`) AS avg_gross_income
FROM supermarket
GROUP BY gender;

-- THANK YOU 















