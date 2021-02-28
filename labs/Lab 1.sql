---Question 5
SELECT customer_last_name, customer_first_name
FROM customers
WHERE customer_state = 'DC'

---Question 6
SELECT vendor_name, vendor_address1, vendor_address2, vendor_city
FROM vendors
WHERE vendor_state = "OH"
ORDER BY vendor_city, vendor_name

---Question 7
SELECT invoice_number, payment_date, payment_total
FROM invoices
WHERE payment_date IS NULL

---Question 8
SELECT DISTINCT artist
FROM items
ORDER BY artist DESC

---Question 9
SELECT CONCAT(customer_last_name, ", ", customer_first_name) AS "Full Name"
FROM customers

---Question 10
SELECT invoice_number, payment_date, invoice_due_date, credit_total
FROM invoices
WHERE credit_total > 0 AND payment_date > invoice_due_date
