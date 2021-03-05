---Question 2
USE ap;

SELECT v.vendor_name, v.vendor_contact_first_name, v.vendor_state
FROM vendors v
WHERE vendor_id IN (
  SELECT i.vendor_id
  FROM invoices i
    JOIN invoice_line_items ili
    ON ili.invoice_id = i.invoice_id
  WHERE ili.line_item_amount < 100
);


---Question 3
USE ap;

WITH line_item_under_100 AS (
  SELECT v.vendor_name, v.vendor_contact_first_name, v.vendor_state
  FROM vendors v
  WHERE vendor_id IN (
    SELECT i.vendor_id
    FROM invoices i
      JOIN invoice_line_items ili
      ON ili.invoice_id = i.invoice_id
    WHERE ili.line_item_amount < 100
  )
)

SELECT * FROM line_item_under_100;


---Question 4
USE ap;

SELECT v.vendor_name AS 'Vendor Name',
  CONCAT("$", FORMAT(i.invoice_number, 2)) AS 'Invoice Number',
  CAST(i.invoice_date AS DATETIME) AS 'Invoice Date/Time',
  i.invoice_total AS 'Invoice Total'
FROM invoices i
INNER JOIN vendors v
ON v.vendor_id = i.vendor_id
WHERE i.invoice_date = (
  SELECT MAX(invoice_date)
  FROM invoices i2
  WHERE i2.invoice_total < 100 AND i.vendor_id = i2.vendor_id
)
ORDER BY i.invoice_total;


---Question 5
USE ap;
SET sql_mode = '';

SELECT UPPER(v.vendor_name) AS 'Vendor Name',
  LOWER(v.vendor_contact_first_name) AS 'Contact Person',
  REPLACE(REPLACE(v.vendor_phone, "(", ""), ") ", "-") AS 'Vendor Phone',
  DATE_FORMAT(MAX(i.invoice_date), "%Y, %M %e") AS 'Latest Invoice'
FROM vendors v
INNER JOIN invoices i
ON v.vendor_id = i.vendor_id
GROUP BY i.vendor_id
ORDER BY i.invoice_date;
