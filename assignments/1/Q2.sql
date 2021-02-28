/* Assignment #1, Question #2 */
USE om;

SELECT a.order_date, a.shipped_date, b.customer_state, b.customer_address, CONCAT(b.customer_first_name, " ", b.customer_last_name) AS "customer_full_name"
FROM orders a
        JOIN customers b ON (b.customer_id = a.customer_id)
WHERE shipped_date IS NOT NULL
UNION
SELECT a.order_date, "Not yet shipped", b.customer_state, b.customer_address, CONCAT(b.customer_first_name, " ", b.customer_last_name) AS "customer_full_name"
FROM orders a
        JOIN customers b ON (b.customer_id = a.customer_id)
WHERE shipped_date IS NULL
ORDER BY order_date DESC, customer_full_name ASC
