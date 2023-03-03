-- Lab | SQL Queries 9

-- In this lab, you will be using the Sakila database of movie rentals.

USE sakila;

-- Instructions

-- 1. Create a Python connection with SQL database and retrieve the results of the following queries as dataframes:

-- 2. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name) AS distinct_last_names
FROM actor;

-- 3. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, IF(weekday(rental_date)<6,"workday","weekend") as day_type, WEEKDAY(rental_date) as checkday
FROM rental;

-- 4. Get all films with ARMAGEDDON in the title.

SELECT title
FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- 5. Get 10 the longest films.

SELECT *
FROM film
ORDER BY length DESC
LIMIT 10;

-- 6. How many films include Behind the Scenes content?

SELECT COUNT(*) AS 'Behind the Scenes included'
FROM film
WHERE special_features LIKE "%Behind_the_Scenes%";

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating, ROUND(AVG(length), 2) AS 'Average'
FROM film
GROUP BY rating
HAVING average >120;


-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT title, length, RANK() OVER(ORDER BY length DESC) 
FROM sakila.film;