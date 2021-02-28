---Question 2
SELECT a.vendor_name, COUNT(b.invoice_id) AS "invoice_count", SUM(b.invoice_total) AS "invoice_total_sum", AVG(b.invoice_total) AS "invoice_average"
FROM vendors a
   JOIN invoices b
   ON (a.vendor_id = b.vendor_id)
GROUP BY a.vendor_id
ORDER BY `invoice_count` DESC;

---Question 3
USE AP;
SELECT DISTINCT vendor_name
FROM vendors v
WHERE (SELECT vendor_id
      FROM invoices b
      WHERE b.vendor_id = v.vendor_id
      LIMIT 1
)
ORDER BY vendor_name;

---Question 4
USE AP;
SELECT invoice_number, invoice_total
FROM invoices
WHERE payment_total > (
   SELECT AVG(invoice_total) FROM invoices WHERE invoice_total > 0
)
ORDER BY invoice_total DESC;

---Question 5
----As Standard query
SELECT vendor_id, MAX(invoice_total) AS "highest_balance"
FROM invoices
WHERE (invoice_total - (credit_total + payment_total)) > 0
GROUP BY vendor_id
ORDER BY `highest_balance` DESC

----As Common table expression
WITH max_invoice AS (
   SELECT vendor_id, MAX(invoice_total) AS "highest_balance"
   FROM invoices
   WHERE (invoice_total - (credit_total + payment_total)) > 0
   GROUP BY vendor_id
   ORDER BY `highest_balance` DESC
)

SELECT SUM(highest_balance)
FROM max_invoice
