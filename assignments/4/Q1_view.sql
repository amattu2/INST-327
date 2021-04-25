---Assignment #4, Question #1
USE ap;

CREATE OR REPLACE VIEW late_invoices (Vendor_Name, Invoice_Number, Invoice_Due, Invoice_Paid_Date, Payment_Late_Days, Invoice_Total) AS (
  SELECT v.vendor_name AS Vendor_Name,
    i.invoice_number AS Invoice_Number,
    DATE_FORMAT(i.invoice_due_date, "%M %D") AS Invoice_Due,
    DATE_FORMAT(i.payment_date, "%M %D") AS Invoice_Paid_Date,
    DATEDIFF(i.payment_date, i.invoice_due_date) AS Payment_Late_Days,
    CONCAT("$", FORMAT(i.invoice_total, 2)) AS Invoice_Total
  FROM invoices i
  INNER JOIN vendors v
    ON i.vendor_id = v.vendor_id
  WHERE i.payment_date > i.invoice_due_date OR i.payment_date IS NULL
  ORDER BY Payment_Late_Days DESC, i.invoice_total DESC
);
