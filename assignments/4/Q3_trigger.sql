---Assignment #4, Question #3
-- Script for the trigger 'new_invoice_row'

DROP TRIGGER IF EXISTS new_invoice_row;

DELIMITER //

CREATE TRIGGER new_invoice_row
  AFTER INSERT ON invoices FOR EACH ROW

BEGIN
  DECLARE invoice_id_var INT;
  DECLARE invoice_total_var DECIMAL(9,2);
  DECLARE vendor_id_var INT;
  DECLARE vendor_name_var VARCHAR(30);

  SET invoice_id_var = NEW.invoice_id;
  SET invoice_total_var = NEW.invoice_total;
  SET vendor_id_var = NEW.vendor_id;

  SELECT vendor_name INTO vendor_name_var FROM vendors WHERE vendor_id = vendor_id_var;

  INSERT INTO new_invoice_records VALUES (
    NULL,
    CONCAT("You have added a new invoice from ", vendor_name_var, " with an invoice total of $", invoice_total_var),
    NOW()
  );
END//

DELIMITER ;
