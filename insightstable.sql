select t.trans_id, t.trans_dt, t.cust_id, t.prod_id, t.item_qty, t.item_price, 
s.seg_name, s.update_at, s.active_flag, p.prod_name, p.brand, p.category
from transactions t
join segments s
on t.cust_id =  s.cust_id
join products p
on t.prod_id = p.prod_id