-- display all customer details who have made more than 5 payments.
SELECT * FROM customer WHERE customer_id IN ( SELECT customer_id FROM payment GROUP BY customer_id HAVING COUNT(payment_id) > 5);

-- Find the names of actors who have acted in more than 10 films.
SELECT first_name FROM actor WHERE actor_id IN ( SELECT actor_id FROM film_actor GROUP BY actor_id HAVING COUNT(film_id) > 10);

-- Find the names of customers who never made a payment.
SELECT first_name FROM customer WHERE customer_id NOT IN ( SELECT DISTINCT customer_id FROM payment );

-- List all films whose rental rate is higher than the average rental rate of all films.
SELECT title, rental_rate FROM film WHERE rental_rate > ( SELECT AVG(rental_rate) FROM film );

-- List the titles of films that were never rented.
SELECT title FROM film WHERE film_id NOT IN ( SELECT film_id FROM inventory WHERE inventory_id IN ( SELECT inventory_id FROM rental));

-- Display the customers who rented films in the same month as customer with ID 5.
WITH cte_month AS (
    SELECT DISTINCT
        YEAR(rental_date)  AS rental_year,
        MONTH(rental_date) AS rental_month
    FROM rental
    WHERE customer_id = 5
)
SELECT c.first_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN cte_month m
    ON  YEAR(r.rental_date)  = m.rental_year
    AND MONTH(r.rental_date) = m.rental_month
WHERE c.customer_id <> 5;

-- Find all staff members who handled a payment greater than the average payment amount.
WITH cte_2 AS (
    SELECT AVG(amount) AS amount
    FROM payment
)
SELECT DISTINCT s.first_name, s.last_name
FROM staff s
JOIN payment p   ON s.staff_id = p.staff_id
JOIN cte_2  ON p.amount > cte_2.amount;

-- Show the title and rental duration of films whose rental duration is greater than the average.
WITH cte_3 AS (
    SELECT AVG(rental_duration) AS duration
    FROM film
)
SELECT f.title, f.rental_duration
FROM film f
JOIN cte_3 ON f.rental_duration > cte_3.duration
ORDER BY f.rental_duration DESC;

-- Find all customers who have the same address as customer with ID 1.

CREATE TEMPORARY TABLE temp AS
    SELECT address_id
    FROM   customer
    WHERE  customer_id = 1;

SELECT  c.first_name, c.last_name, a.address FROM customer c JOIN address  a  ON  c.address_id = a.address_id JOIN temp t ON  c.address_id = t.address_id WHERE  c.customer_id <> 1;

-- List all payments that are greater than the average of all payments.
CREATE OR REPLACE VIEW temp_view AS SELECT  payment_id, customer_id, staff_id, amount, payment_date FROM  payment WHERE   amount > ( SELECT AVG(amount) FROM   payment );

SELECT * FROM temp_view ORDER BY amount DESC;