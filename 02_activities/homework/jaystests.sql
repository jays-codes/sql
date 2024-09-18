--left join example
-- /* 1. Write a query that returns the vendor_id, vendor_name, and booth_count for all vendors,
-- even if they don’t have any booth assignments. */

SELECT v.vendor_id, v.vendor_name, COUNT(vba.vendor_id) AS booth_count
FROM vendor v
LEFT JOIN vendor_booth_assignments vba
ON v.vendor_id = vba.vendor_id
GROUP BY v.vendor_id;

SELECT customer_id FROM customer_purchases cp INNER JOIN customer c ON c.customer_id= cp.customer_id

SELECT * FROM vendor v JOIN vendor_inventory vi ON vi.vendor_id= v.vendor_id

SELECT p.*, pc.* FROM product p LEFT JOIN product_category pc ON p.product_id= pc.product_id

--how much did each customer spent on each market_day
SELECT c.customer_id, cp.market_date, SUM(cp.quantity * cp.cost_to_customer_per_qty) AS total_spent
FROM customer c
JOIN customer_purchases cp
ON c.customer_id = cp.customer_id
GROUP BY c.customer_id, cp.market_date;

--how much did each customer spent on total. 

SELECT c.customer_id, c.customer_first_name, c.customer_last_name, SUM(cp.quantity * cp.cost_to_customer_per_qty) AS total_spent
FROM customer c
JOIN customer_purchases cp
ON c.customer_id = cp.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;


--whats the single item that has been bought in the greatest quantity in one transaction. show product name 
SELECT p.product_name, SUM(cp.quantity) AS total_quantity
FROM product p
JOIN customer_purchases cp
ON p.product_id = cp.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

--whats the single item that has been bought in the greatest quantity in one transaction
SELECT p.product_name, cp.quantity
FROM product p  
JOIN customer_purchases cp
ON p.product_id = cp.product_id
ORDER BY cp.quantity DESC
LIMIT 1;

-- calculate sales per vendor per day using CTE group by market_date and vendor_id
-- format total sales to 2 decimal places
WITH sales_by_vendor AS (
    SELECT v.vendor_id, v.vendor_name, cp.market_date, SUM(cp.quantity * cp.cost_to_customer_per_qty) AS total_sales
    FROM vendor v
    JOIN vendor_inventory vi
    ON v.vendor_id = vi.vendor_id
    JOIN customer_purchases cp
    ON vi.product_id = cp.product_id
    GROUP BY v.vendor_id, v.vendor_name, cp.market_date
)
SELECT vendor_id, vendor_name, market_date, ROUND(total_sales, 2)
FROM sales_by_vendor
ORDER BY vendor_id, market_date;

-- calculate sales per vendor per day using CTE group by market_date and vendor_id
-- format total sales to 2 decimal places
WITH sales_by_vendor AS (
    SELECT v.vendor_id, v.vendor_name, cp.market_date, SUM(cp.quantity * cp.cost_to_customer_per_qty) AS total_sales
    FROM vendor v
    JOIN vendor_inventory vi
    ON v.vendor_id = vi.vendor_id
    JOIN customer_purchases cp
    ON vi.product_id = cp.product_id
    GROUP BY v.vendor_id, v.vendor_name, cp.market_date
)
SELECT vendor_id, vendor_name, market_date, ROUND(total_sales, 2) AS total_sales


