/* Create views */
USE ForestGlenInn;

CREATE OR REPLACE VIEW viewReservations AS
	SELECT reservation_id, last_name, first_name, room_number, DATE_FORMAT(check_in_date,'%Y-%m-%d') as check_in_date, DATE_FORMAT(check_out_date,'%Y-%m-%d') as check_out_date
    FROM reservations
		JOIN guests USING(guest_id)
        JOIN rooms USING(room_id)
	ORDER BY check_in_date;
        
CREATE OR REPLACE VIEW viewCancellations AS
	SELECT last_name, first_name, DATE_FORMAT(cancellation_date, '%Y-%m-%d') as cancellation_date, 
		DATE_FORMAT(orig_check_in_date, '%Y-%m-%d') as orig_check_in_date, DATE_FORMAT(orig_check_out_date,'%Y-%m-%d') as orig_check_out_date, cancellation_fee
    FROM cancellations
		JOIN guests USING(guest_id)
	ORDER BY cancellation_date DESC;
        
