-- Joins Practice

-- List all film titles along with their language name.

select f.title , l.name from film f Inner Join `language` l on l.language_id = f.language_id

-- Show each customer's full name and their city.

select CONCAT(c.first_name,' ',c.last_name) as Fullname , p.city from customer c Inner join address a on a.address_id = c.address_id Inner Join city p on p.city_id = a.city_id

-- Display payment amounts with the customer's first and last name.

select CONCAT(c.first_name,' ',c.last_name) as Fullname , p.amount from customer c Inner Join payment p  on p.customer_id =c.customer_id 

-- Total Payments done by each customer

select CONCAT(c.first_name,' ',c.last_name) as Fullname , sum(p.amount) from customer c Inner Join payment p  on p.customer_id =c.customer_id group by c.customer_id 

-- List all actors who appeared in the film 'ACADEMY DINOSAUR'

select a.first_name , f.title from actor a inner join film_actor fa on fa.actor_id = a.actor_id inner join film f on f.film_id = fa.film_id where f.title = 'ACADEMY DINOSAUR' 

-- Show the store ID and manager's full name for each store.

select st.store_id , CONCAT(s.first_name ,' ',s.last_name) as Fullname from staff s inner join store st on st.manager_staff_id =s.staff_id

-- List rental IDs with the title of the rented film.

select r.rental_id , f.title from rental r inner join inventory i on i.inventory_id = r.inventory_id inner join film f on f.film_id = i.film_id

-- Show each film's title and its category name.

select f.title , c.name as Genre from film f inner join film_category fc on fc.film_id = f.film_id inner join category c on c.category_id = fc.category_id

-- List staff members with the address of their store.

select  s.first_name , a.* from staff s inner join store st on st.store_id = s.store_id join address a on a.address_id = st.address_id

select  s.first_name , a.* from staff s inner join store st on st.store_id = s.store_id right join address a on a.address_id = st.address_id where s.first_name is not Null

-- Find customers who have rented at least 30 films. Show name and rental count.

select c.first_name , count(r.rental_id) as RentalCount from customer c inner join rental r on r.customer_id = c.customer_id GROUP BY r.customer_id having COUNT(r.rental_id) >= 30

-- List films with their replacement cost and the number of copies in inventory.

select f.title , f.replacement_cost , count(i.inventory_id) as NumCopies from film f inner join inventory i on i.film_id = f.film_id group by f.film_id

-- Show total payment amount per staff member with their full name.

select CONCAT(s.first_name,' ',s.last_name) , sum(p.amount) from staff s inner join payment p on p.staff_id = s.staff_id group by p.staff_id

-- List all customers along with the films they have rented

SELECT c.first_name,f.title FROM customer c INNER JOIN rental r ON c.customer_id  = r.customer_id INNER JOIN inventory i  ON r.inventory_id = i.inventory_id INNER JOIN film f ON i.film_id = f.film_id

SELECT c.first_name , COUNT(r.rental_id) FROM customer c LEFT JOIN rental r ON c.customer_id = r.customer_id GROUP BY c.customer_id, c.first_name

-- Show all films with their category — include films with no category assigned

SELECT f.title, f.rating FROM film f LEFT JOIN film_category fc ON f.film_id = fc.film_id LEFT JOIN category c ON fc.category_id = c.category_id

-- Find all actors who acted in the film "ACADEMY DINOSAUR"

SELECT a.first_name , f.title FROM film f INNER JOIN film_actor fa ON f.film_id  = fa.film_id INNER JOIN actor a  ON fa.actor_id = a.actor_id WHERE f.title = 'ACADEMY DINOSAUR'

-- List all stores with total staff count, even stores with no staff

SELECT a.address , COUNT(s.staff_id) FROM store st LEFT JOIN staff   s  ON st.store_id  = s.store_id LEFT JOIN address a  ON st.address_id = a.address_id LEFT JOIN city    ci ON a.city_id     = ci.city_id
GROUP BY st.store_id, a.address

-- Customers who rented more than 5 times — name and total rental count

SELECT c.first_name , COUNT(r.rental_id) FROM customer c INNER JOIN rental r ON c.customer_id = r.customer_id GROUP BY c.customer_id, c.first_name
HAVING COUNT(r.rental_id) > 5