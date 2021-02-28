---Question 3
CREATE TABLE orders_copy AS
SELECT * FROM orders;

CREATE TABLE order_details_copy AS
SELECT * from order_details;

---Question 4
DELETE FROM orders_copy
WHERE shipped_date IS NOT NULL;

SELECT count(*) AS "Order Count" FROM orders_copy WHERE shipped_date IS NOT NULL;

---Question 5
SELECT * FROM order_details_copy WHERE order_id = 829 AND item_id = 5;

UPDATE order_details_copy SET order_qty = order_qty + 2
WHERE order_id = 829 AND item_id = 5;

---Question 6
INSERT INTO customers_copy
VALUES (26, "Ben", "Mourside", "123 Bird St.", "Rocky Mt.", "GA", "20900", "301-400-5000", "301-600-7000");

SELECT * FROM customers_copy
WHERE customer_id = 26;

--Question 7
SELECT count(order_id) AS "Row Count"
FROM order_details_copy
WHERE order_id = 829
