---Question 2
SELECT vendor_name, vendor_state
FROM vendors
WHERE vendor_state = "CA"
UNION
SELECT vendor_name, "Outside CA"
FROM vendors WHERE vendor_state != "CA" ORDER BY vendor_name ASC

---Question 3
SELECT b.department_name, CONCAT(first_name, " ", last_name) AS employee_name
FROM employees
JOIN departments AS b
ON (employees.department_number = b.department_number)
ORDER BY department_name ASC

---Question 4
SELECT b.vendor_name, invoice_date, invoice_number, CONCAT("# ", c.invoice_sequence) AS "inv_sequence", c.line_item_amount AS "li_amount"
FROM invoices
   JOIN vendors AS b
   ON b.vendor_id = invoices.vendor_id
   JOIN invoice_line_items AS c
   ON c.Invoice_Id = invoices.invoice_id
WHERE invoice_number = "I77271-O01"

---Question 5
SELECT b.department_number, b.department_name, a.employee_id
FROM employees a
   RIGHT JOIN departments b
   ON (a.department_number = b.department_number)
WHERE b.department_number = 3

---Question 6
USE ap;
SELECT i.invoice_number, v.vendor_name, line_item_description, line_item_amount
FROM invoice_line_items il
   INNER JOIN invoices i
   ON i.invoice_id = il.invoice_id
   INNER JOIN vendors v
   ON v.vendor_id = i.vendor_id
ORDER BY i.invoice_number ASC, line_item_amount DESC
