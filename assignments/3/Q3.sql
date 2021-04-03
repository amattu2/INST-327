WITH valid_card_cte (customer_name, order_id, card_number, card_type, card_expires) AS (
    SELECT CONCAT(c.first_name, " ", c.last_name) AS "customer_name",
    o.order_id,
    o.card_number,
    o.card_type,
    o.card_expires
    FROM orders o
    INNER JOIN customers c ON (c.customer_id = o.customer_id)
    WHERE card_type IN ("Visa", "Mastercard")

    UNION

    SELECT CONCAT(c.first_name, " ", c.last_name) AS "customer_name",
    o.order_id,
    o.card_number,
    "Invalid Card Type",
    o.card_expires
    FROM orders o
    INNER JOIN customers c ON (c.customer_id = o.customer_id)
    WHERE card_type IN ("Discover", "American Express")
);

WITH valid_card_cte (customer_name, order_id, card_number, card_type, card_expires) AS (
    SELECT CONCAT(c.first_name, " ", c.last_name) AS "customer_name",
    o.order_id,
    o.card_number,
    IF(o.card_type IN ("American Express", "Discover"), "Invalid Card Type", o.card_type),
    o.card_expires
    FROM orders o
    INNER JOIN customers c ON (c.customer_id = o.customer_id)
    ORDER BY IF(o.card_type IN ("American Express", "Discover"), 1, 0)
);

SELECT vcc.customer_name,
        vcc.order_id,
    p.product_name,
    CONCAT("$", FORMAT(p.list_price, 2)) AS "item_price",
    vcc.card_number,
    vcc.card_type,
    vcc.card_expires
FROM valid_card_cte vcc
INNER JOIN order_items oi ON (vcc.order_id = oi.order_id)
INNER JOIN products p ON (oi.product_id = p.product_id)
ORDER BY vcc.customer_name;
