/* Assignment #1, Question #1 */
/* TA said we can use WHERE vendor_state for this Q */
USE ap;

SELECT vendor_name AS Vendor, CONCAT("Phone #: ", vendor_phone) as "Phone Number", vendor_city as City, vendor_address1 AS Address
FROM vendors
WHERE vendor_state = "CA"
ORDER BY vendor_city ASC, vendor_name ASC
