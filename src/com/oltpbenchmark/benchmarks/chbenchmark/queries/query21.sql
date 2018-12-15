SELECT su_name,
       count(*) AS numwait
FROM supplier,
     order_line l1,
     oorder,
     stock,
     nation
WHERE ol_o_id = o_id
  AND ol_w_id = o_w_id
  AND ol_d_id = o_d_id
  AND ol_w_id = s_w_id
  AND ol_i_id = s_i_id
  AND mod((s_w_id * s_i_id),10000) = su_suppkey
  AND NOT EXISTS
    (SELECT *
     FROM order_line l2
     WHERE l2.ol_o_id = l1.ol_o_id
       AND l2.ol_w_id = l1.ol_w_id
       AND l2.ol_d_id = l1.ol_d_id)
  AND su_nationkey = n_nationkey
  AND n_name = 'Germany'
GROUP BY su_name
ORDER BY numwait DESC, su_name;
