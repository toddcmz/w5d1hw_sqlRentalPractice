-- 1 How many actors last name Wahlberg
-- A: 2
SELECT COUNT(last_name)
	FROM actor
	WHERE last_name = 'Wahlberg';
	

-- 2 How many payments between 3.55 and 5.99
-- A: 5,607
SELECT COUNT(amount)
	FROM payment
	WHERE amount BETWEEN 3.99 AND 5.99;

-- 3 What film does the store have the most copies of 
-- A: across all stores, 8 is the most copies of a film, and there are 72 films with 8 copies
SELECT film_id, COUNT(film_id)
	FROM inventory
	GROUP BY film_id
	ORDER BY COUNT(film_id) DESC;

-- 4 How many customers have the last name 'William'
-- A: 0 customers have the last name William...now 'Williams' on the other hand...
SELECT COUNT(last_name)
	FROM customer
	WHERE last_name = 'William';
	

-- 5 What store employee ID sold the most rentals?
-- A: Staff member ID 2, with 8,040. There are only 2 staff members?!
SELECT staff_id, COUNT(staff_id) count_sales
	FROM rental
	GROUP BY staff_id 
	ORDER BY count_sales DESC;

-- 6 How many unique district names are there?
-- A: 378
SELECT count(DISTINCT district)
	FROM address;

-- 7 Which film has the most actors?
-- A: ID 508, Lambs Cincinatti
SELECT film_id, COUNT(actor_id)
	FROM film_actor
	GROUP BY film_id 
	ORDER BY COUNT(actor_id) DESC;
	
SELECT title
	FROM film
	WHERE film_id = 508;

-- 8 From store_id 1, how many customers have a last name ending with 'es'
-- A: 13, apparently
SELECT COUNT(last_name)
	FROM customer
	WHERE store_id = 1 AND last_name LIKE '_%es';

-- 9 How many payment amounts had a number of rentals above 250 for
-- customers with ids between 380 and 430
-- A: 3 payment amounts (2.99, 4.99, 0.99)
SELECT amount, COUNT(amount) num_transactions
	FROM payment
	WHERE customer_id BETWEEN 380 AND 430
	GROUP BY amount 
		HAVING COUNT(amount) > 250;

-- 10 Within the film table, how many rating categories are there,
-- and which rating has the most movies in it? 
-- A: there are 5 rating categories and PG-13 has the most movies
SELECT rating, COUNT(rating)
	FROM film
	GROUP BY rating
	ORDER BY COUNT(rating) DESC;
