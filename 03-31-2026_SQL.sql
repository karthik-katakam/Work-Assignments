USE sakila;

select title , release_year , rental_rate from sakila.film

select first_name , last_name , email from sakila.staff

select * from sakila.category

select DISTINCT(rating) from sakila.film

select title from sakila.film where rental_rate = 0.99

select * from sakila.customer where active = 0

select * from sakila.film where rating = 'PG-13' and rental_duration = 7

select * from sakila.customer where store_id = 1 and active = 1

select * from sakila.actor order by last_name 

select * from sakila.film order by rental_rate  desc , title asc

select * from sakila.film limit 5

select * from sakila.film order by replacement_cost desc limit 10

select * from sakila.film order by `length` desc limit 3

select * from sakila.customer where last_name like '%man'

select * from sakila.film where rating IN ('G', 'PG', 'PG-13');

select * from sakila.film where rating Not IN ('G', 'PG', 'PG-13');

select * from sakila.film where `length` between 100 and 150

select * from sakila.rental where return_date is null

select count(*) from sakila.customer

select rating , count(*) from  sakila.film group by rating

select store_id , count(*) from sakila.customer group by store_id 

select rating , count(*) from  sakila.film group by rating having count(*) > 195