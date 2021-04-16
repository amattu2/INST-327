USE ForestGlenInn;

DROP TRIGGER IF EXISTS reservations_after_delete;

DELIMITER //

CREATE TRIGGER reservations_after_delete
  AFTER DELETE ON reservations
  FOR EACH ROW
BEGIN
    INSERT INTO cancellations(guest_id, orig_check_in_date, orig_check_out_date, cancellation_date)
    VALUES (OLD.guest_id, OLD.check_in_date, OLD.check_out_date, sysdate());
END//

DELIMITER ;