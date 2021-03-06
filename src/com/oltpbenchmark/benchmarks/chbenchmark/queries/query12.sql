SELECT o_ol_cnt,
       sum(CASE WHEN o_carrier_id = 1
           OR o_carrier_id = 2 THEN 1 ELSE 0 END) AS high_line_count,
       sum(CASE WHEN o_carrier_id <> 1
           AND o_carrier_id <> 2 THEN 1 ELSE 0 END) AS low_line_count
FROM oorder,
     order_line
WHERE ol_w_id = o_w_id
  AND ol_d_id = o_d_id
  AND ol_o_id = o_id
GROUP BY o_ol_cnt
ORDER BY o_ol_cnt;
