-- DROP DATABASE IF EXISTS sakila;
-- CREATE DATABASE sakila;
USE sakila;


-- Upper case and Lower Case

-- select upper(first_name) from sakila.actor
select upper(first_name) as FirstName from sakila.actor

select lower(first_name) as firstname from sakila.actor

-- concat 
select CONCAT(first_name ,' ', last_name) as FullName from sakila.actor

-- length
select first_name , length(first_name) as Length from sakila.actor

-- SubString
select first_name , SUBSTR(first_name , 1 , 4) from sakila.actor

-- trim
select trim("  karthik  ") as Trimed

select first_name , last_name from sakila.actor where first_name like '%Kar%'

-- select first_name , last_name from sakila.actor where instr(first_name,'Kar') > 0

select first_name , last_name , REPLACE(first_name,'KAR','aaa') from sakila.actor where first_name like '%Kar%'

select first_name , left(first_name,3) , right(first_name,3) from sakila.actor

select first_name , lpad(first_name,12,'-') , rpad(first_name,12,'-') from sakila.actor

select first_name , locate('K',first_name) from sakila.actor

select first_name , reverse(first_name) from sakila.actor

-- Regex

select first_name from sakila.actor where first_name REGEXP('^K')

select first_name from sakila.actor where first_name REGEXP('K$')

select first_name from sakila.actor where first_name REGEXP('K.R')

select first_name from sakila.actor where first_name REGEXP('^[AEIOU].[AEIOU]$')

select first_name from sakila.actor where first_name REGEXP('[AEIOU][AEIOU]')

select first_name from sakila.actor where first_name REGEXP('^.{3}$')

select first_name from sakila.actor where first_name REGEXP('^.{3,5}$')

select first_name from sakila.actor where first_name REGEXP('^[AEIOU]+$')

-- Math

select amount from sakila.payment 

select abs(amount) from sakila.payment

select ceil(amount) from sakila.payment

select floor(amount) from sakila.payment

select TRUNCATE(amount,1) from sakila.payment 

select POWER(ceil(amount) , 2) from sakila.payment
