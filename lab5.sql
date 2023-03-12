USE sakila;
-- Select all the actors with the first name ‘Scarlett’.
SELECT first_name, last_name

FROM actor

WHERE first_name = "Scarlett";

-- How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT( inventory_id ) as numOfDVDsOnRent
FROM rental
WHERE return_date IS NULL;


-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT 
    MIN(length) as min_duration, 
    MAX(length) as max_duration
FROM 
    film;


-- What's the average movie duration expressed in format (hours, minutes)?
SELECT 
    CONCAT(
        FLOOR(AVG(length) / 60), 
        'h ',
        AVG(length) % 60, 
        'm'
    ) as average_duration
FROM 
    film;


-- How many distinct (different) actors' last names are there?
select count(distinct last_name) from actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(NOW(), rental_date) as days_operating FROM rental;


-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT DATE_FORMAT(rental_date,'%M') AS 'month', DATE_FORMAT(rental_date,'%a') AS 'day'
FROM rental
LIMIT 20;
SELECT rental_date,


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
CASE
WHEN DATE_FORMAT(rental_date,'%a') = 'Sat' then 'weekend'
WHEN DATE_FORMAT(rental_date,'%a') = 'Sun' then 'weekend'
ELSE 'weekday'
END AS column_day_type
FROM rental;
-- Get release years.
SELECT title, release_year
FROM film;

-- Get all films with ARMAGEDDON in the title.
SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT *
FROM film
WHERE title LIKE '%APOLLO';

-- Get 10 the longest films.
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT COUNT(special_features) as 'Behind_the_Scenes_content'
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
