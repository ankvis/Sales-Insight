# Sales-Insight

Data Description
There are three tables involved in this question: `transactions`, `segments` and
`products`, which simulate a simplified retail data schema.  Here is a semantic
description of the tables:

- `transactions`: contains detailed information about each product a customer
   has purchased.  A transaction consists of one or more products purchased by
   a customer indexed by a unique transaction id.
   * `trans_id`: the transaction id
   * `cust_id`: the customer id
   * `prod_id`: the product id
   * `item_qty`: the quantity of the product that is being purchased
   * `item_price`: the per unit price of the product (NOTE: the total revenue
     for a product is `item_qty * item_price`)
- `products`: contains detailed attributes about each product.
   * `prod_id`: the product id (same meaning as in `transactions`)
   * `prod_name`: the product name
   * `brand`: the brand of the product
   * `category`: the category of the product
- `segments`: contains a history of customer segmentation labelling for each
   customer.  Segments are computed periodically for all current customers and
   appended to the table after each computation.  The current (most up to date)
   active segment for each customer is specified by `active_flag = 'Y'` column.
   * `cust_id`: the customer id (same meaning as in `transactions`)
   * `seg_name`: the segment of this customer
   * `update_dt`: the date when this segment was updated
   * `active_flag`: whether or not this segment is the active segment for this customer

### Steps -

1. Joined the 3 tables from the database using the following code - <br>
    `select t.trans_id, t.trans_dt, t.cust_id, t.prod_id, t.item_qty, t.item_price,
    s.seg_name, s.update_at, s.active_flag, p.prod_name, p.brand, p.category
    from transactions t
    join segments s
    on t.cust_id =  s.cust_id
    join products p
    on t.prod_id = p.prod_id`
2. Saved it as a csv file  called *insights.csv*.
    - Visually assessed the data in Microsoft Excel
3. In Jupyter Notebook, read the csv file to a dataframe called 'df'.
4. Assessed and Cleaned the dataframe. 
    - Checked for Nulls.
    - Checked for Duplicates.
    - Inspected dataframe for data discrepencies. 
    - Found the unique values and top count for number or rows in the dataframe.
    - Converted *trans_dt* and *update_at* to datetime datatype.
    - Converted *trans_id, cust_id and prod_id* to categorical datatype. 
    - Extracted months from trans_dt and made a new column called *trans_month*.
    - Verified the changes made to the dataframe at various stages.
5. Exploratary analysis done by visualizing the data, searching for insights.   
6. Based on the findings, summarized the insights. 
7. Explanatory analysis presented in powerpoint to provide results. 