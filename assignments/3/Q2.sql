SELECT CONCAT(c.first_name, " ", c.last_name) AS "Customer Name", c.email_address AS "Customer Email", CONCAT(a.line1, " ", a.line2) AS "Customer Address", CONCAT(a.city, ", ", a.state, " ", a.zip_code) AS "Customer City/State/Zip"
FROM customers c
INNER JOIN addresses a ON (c.shipping_address_id = a.address_id)
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM order_items oi
    INNER JOIN orders o ON (oi.order_id = o.order_id)
    INNER JOIN products p ON (oi.product_id = p.product_id)
    INNER JOIN categories ca ON (p.category_id = ca.category_id)
    WHERE ca.category_name = "Guitars"
)
GROUP BY c.customer_id
ORDER BY c.last_name ASC;
