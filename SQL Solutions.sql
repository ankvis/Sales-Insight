/*
SELECT cust_id, seg_name, update_at
FROM segments
WHERE active_flag = 'Y'
ORDER BY update_at;


SELECT  t.prod_id, p.prod_name, count(DISTINCT t.trans_id) as count
FROM transactions t
JOIN products p
ON  t.prod_id = p.prod_id
WHERE t.trans_dt BETWEEN '2015-12-31' AND '2016-06-01'
GROUP BY p.prod_id;


SELECT  cust_id , seg_name, max(update_at) as update_at
FROM segments
WHERE update_at <= '2016-03-01'
GROUP BY cust_id;

Select seg_name, category, max(revenue) as revenue
FROM
(
SELECT  s.seg_name, p.category,  SUM(t.item_qty * t.item_price) revenue
FROM segments s
JOIN transactions t
ON s.cust_id = t.cust_id
JOIN products p
ON p.prod_id = t.prod_id
WHERE s.active_flag = 'Y'
GROUP BY s.seg_name, p.category
)
GROUP by seg_name;
*/