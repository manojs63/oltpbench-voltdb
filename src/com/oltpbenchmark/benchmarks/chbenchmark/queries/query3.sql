SELECT ol_o_id,
       sum(ol_amount) AS revenue
FROM customer,
     oorder,
     order_line
WHERE c_state LIKE 'A%'
  AND c_id = o_c_id
  AND ol_w_id = o_w_id
  AND ol_d_id = o_d_id
GROUP BY ol_o_id
ORDER BY revenue DESC; 
