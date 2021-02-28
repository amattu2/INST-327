/* Assignment #1, Question #4 */
USE ap;

SELECT b.vendor_name, CONCAT(b.vendor_city, ", ", b.vendor_state) AS "vendor_city/state", a.invoice_number, a.payment_total, a.invoice_date, a.invoice_due_date
FROM invoices a
        JOIN vendors b
            ON (a.vendor_id = b.vendor_id)
WHERE MONTH(a.invoice_due_date) > 5 AND MONTH(a.invoice_due_date) < 7
ORDER BY DAY(a.invoice_due_date) ASC, b.vendor_name ASC
