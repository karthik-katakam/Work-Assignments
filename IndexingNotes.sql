A Clustered Index defines the physical order of rows in a table.

Primary Key is always the clustered index

A non-clustered index does not change the physical data order. It creates a separate structure with indexed columns and pointers to the actual rows.

A non-clustered index is Indexed column Pointer to actual row

CREATE INDEX i_last_name ON customer(last_name);

SELECT *  FROM customer WHERE last_name like '%J%'

EXPLAIN SELECT *  FROM customer WHERE last_name='jackson'

CREATE INDEX id_rental_date ON rental(rental_date);

EXPLAIN SELECT * FROM rental WHERE rental_date = '2005-05-25';

explain SELECT * FROM rental WHERE rental_date = '2005-05-24 22:53:30';

SELECT * FROM rental

