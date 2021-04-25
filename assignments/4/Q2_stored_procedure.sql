---Assignment #4, Question #2
-- Q2 Solved

USE ap;

DROP PROCEDURE IF EXISTS owed_to_state_vendors;

DELIMITER //
CREATE PROCEDURE owed_to_state_vendors (
  vendor_state_param VARCHAR(50)
)

BEGIN
  --- CTE to select ALL vendors and aggregate their balance due
  WITH unpaid_vendor_state_cte (vendor_state, vendor_name, total_due) AS (
    SELECT v.vendor_state, v.vendor_name, SUM(i.invoice_total - i.payment_total + i.credit_total) AS total_due
    FROM vendors v
    INNER JOIN invoices i
        ON i.vendor_id = v.vendor_id
    WHERE (i.invoice_total - i.payment_total + i.credit_total) > 0
    GROUP BY v.vendor_id
    ORDER BY total_due DESC
  )

  --- Query to filter the CTE result set by the state argument
  SELECT * FROM unpaid_vendor_state_cte WHERE vendor_state = vendor_state_param LIMIT 1;
END //

DELIMITER ;

CALL owed_to_state_vendors('CA');
