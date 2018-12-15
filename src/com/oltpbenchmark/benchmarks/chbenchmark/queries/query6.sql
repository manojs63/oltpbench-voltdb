SELECT sum(ol_amount) AS revenue
FROM order_line
WHERE 
   ol_quantity BETWEEN 1 AND 100000
