CTE - Common Table Expression

Split big queries into smaller, reusable pieces.

WITH customer_payments AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(p.amount) AS total_paid
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT customer_name, total_paid
FROM customer_payments
ORDER BY total_paid DESC
LIMIT 5;

WITH RECURSIVE 
cte_name [(col1, col2, ...)]
AS ( subquery )
Select col1, col2, .. from cte_name;


with cte_name As (Inner Query) main query

Limitation - But Scope is limited to just query level , But handled Resuability and readability.

Examples :

Select 

TEMPORARY TABLE scooe is session level

views - virtual tables increase the scope to database level , we restricting the users by giivng limited data (security - data abstraction).

only the query is stried in view not the entire data




