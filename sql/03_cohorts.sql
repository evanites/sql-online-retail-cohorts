WITH orders AS (
  SELECT
    customer_id,
    invoice_no,
    DATE_TRUNC('month', invoice_ts) AS order_month,
    SUM(quantity * unit_price) AS order_revenue
  FROM v_clean
  GROUP BY 1,2,3
),
first_order AS (
  SELECT
    customer_id,
    MIN(order_month) AS cohort_month
  FROM orders
  GROUP BY 1
),
cohort_orders AS (
  SELECT
    f.cohort_month,
    o.order_month,
    DATE_DIFF('month', f.cohort_month, o.order_month) AS months_since_first,
    o.customer_id
  FROM orders o
  JOIN first_order f USING (customer_id)
)
SELECT
  cohort_month,
  months_since_first,
  COUNT(DISTINCT customer_id) AS active_customers
FROM cohort_orders
GROUP BY 1,2
ORDER BY 1,2;
