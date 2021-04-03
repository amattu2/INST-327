SELECT p.product_name AS "Product Name",
        c.category_name AS "Category Name",
    SUM(o.quantity) AS "Number Purchased",
    CONCAT(FORMAT(p.discount_percent, 2), "%") AS "Maximum Discount",
    CONCAT("$", FORMAT(SUM((o.item_price - o.discount_amount) * o.quantity), 2)) AS "Discounted Order Total"
FROM order_items o
INNER JOIN products p ON (o.product_id = p.product_id)
INNER JOIN categories c ON (p.category_id = c.category_id)
GROUP BY p.product_id WITH ROLLUP
ORDER BY p.product_name;
