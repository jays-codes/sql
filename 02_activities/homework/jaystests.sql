--left join example
-- /* 1. Write a query that returns the vendor_id, vendor_name, and booth_count for all vendors,
-- even if they don’t have any booth assignments. */

SELECT v.vendor_id, v.vendor_name, COUNT(vba.vendor_id) AS booth_count
FROM vendor v
LEFT JOIN vendor_booth_assignments vba
ON v.vendor_id = vba.vendor_id
GROUP BY v.vendor_id;
