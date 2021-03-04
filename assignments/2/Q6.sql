/* Assignment #2, Question #6 */
/* First query: Select all of the orders and aggregate all of the totals by order_id */
/* Second query: Above + Match ONLY the fender stratocaster */
/* Third query: Above + Only unshipped orders */
/* 4th query: Delete the rows sequentially */

SELECT CONCAT(c.first_name, " ", c.last_name) AS "Customer",
        a.line1 AS "Shipping Address",
    o.order_id,
    (
        (SELECT SUM(item_price - discount_amount) FROM order_items WHERE order_id = o.order_id)
        +
        (SELECT SUM(ship_amount + tax_amount) FROM orders WHERE order_id = o.order_id)
    ) as "Total",
    o.ship_date as "Ship Date"
FROM order_items oi
        JOIN orders o
          ON oi.order_id = o.order_id
        JOIN customers_copy c
        ON o.customer_id = c.customer_id
JOIN addresses_copy a
          ON c.shipping_address_id = a.address_id
GROUP BY oi.order_id;

SELECT CONCAT(c.first_name, " ", c.last_name) AS "Customer",
        a.line1 AS "Shipping Address",
    o.order_id,
    (
        (SELECT SUM(item_price - discount_amount) FROM order_items WHERE order_id = o.order_id)
        +
        (SELECT SUM(ship_amount + tax_amount) FROM orders WHERE order_id = o.order_id)
    ) as "Total",
    o.ship_date as "Ship Date"
FROM order_items oi
        JOIN orders o
                    ON oi.order_id = o.order_id
        JOIN customers_copy c
        ON o.customer_id = c.customer_id
JOIN addresses_copy a
                    ON c.shipping_address_id = a.address_id
WHERE oi.product_id = 1
GROUP BY oi.order_id;

SELECT CONCAT(c.first_name, " ", c.last_name) AS "Customer",
        a.line1 AS "Shipping Address",
    o.order_id,
    (
        (SELECT SUM(item_price - discount_amount) FROM order_items WHERE order_id = o.order_id)
        +
        (SELECT SUM(ship_amount + tax_amount) FROM orders WHERE order_id = o.order_id)
    ) as "Total",
    o.ship_date as "Ship Date"
FROM order_items oi
        JOIN orders o
                    ON oi.order_id = o.order_id
        JOIN customers_copy c
        ON o.customer_id = c.customer_id
JOIN addresses_copy a
                    ON c.shipping_address_id = a.address_id
WHERE oi.product_id = 1 AND o.ship_date IS NULL
GROUP BY oi.order_id;

DELETE FROM products_copy
WHERE product_id = 1;
DELETE FROM order_items
WHERE order_id IN (
    SELECT order_id FROM (
        SELECT order_id
            FROM order_items
            WHERE product_id = 1
            GROUP BY order_id
    ) oi_temp
) AND order_id IN (
        SELECT order_id
    FROM orders
    WHERE ship_date IS NULL
);
DELETE FROM orders
WHERE order_id NOT IN (
        SELECT order_id FROM order_items
        GROUP BY order_id
);
