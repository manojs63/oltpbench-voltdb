SELECT ol_number,
       sum(ol_quantity) AS sum_qty,
       sum(ol_amount) AS sum_amount,
       avg(ol_quantity) AS avg_qty,
       avg(ol_amount) AS avg_amount,
       count(*) AS count_order
FROM order_line
GROUP BY ol_number
ORDER BY ol_number;
