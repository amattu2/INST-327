USE ForestGlenInn;

DROP FUNCTION IF EXISTS CalcFee;

DELIMITER //

/* Calculate the cancellation fee based on how many days ahead of the reservation 
		If within 24 hours, fee = 50
        If within 1 week, fee = 25
        If greater than 1 week, no fee
*/
 
CREATE FUNCTION CalcFee
(
    check_in_date_param DATETIME
)
RETURNS INT
BEGIN
  DECLARE num_days_before_check_in INT;
  DECLARE fee_var INT;
  
  SET fee_var = 0;
  
  SELECT DATEDIFF(check_in_date_param, sysdate())
  INTO num_days_before_check_in;
  
  IF num_days_before_check_in < 1 THEN
	SET fee_var = 50;
  ELSEIF num_days_before_check_in < 7 THEN
	SET fee_var = 25;
  END IF;
  
  RETURN(fee_var);
END//

DELIMITER ;
