/* Assignment #1, Question #3 */
USE ap;

SELECT b.invoice_number, b.invoice_total, a.vendor_name, CONCAT(c.first_name, " ", c.last_name) AS "vendor_contact_name", a.vendor_phone, a.vendor_address1
FROM vendors a
LEFT JOIN invoices b
                ON (a.vendor_id = b.vendor_id)
LEFT JOIN vendor_contacts c
            ON (c.vendor_id = a.vendor_id)
ORDER BY a.vendor_name ASC
