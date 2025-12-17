WITH orders AS (
  SELECT
    customer_id,
    invoice_no,
    MIN(invoice_ts) AS invoice_ts,
    SUM(quantity * unit_price) AS order_revenue
  FROM v_clean
  GROUP BY 1,2
),
customer_agg AS (
  SELECT
    customer_id,
    COUNT(*) AS num_orders,
    SUM(order_revenue) AS total_revenue,
    AVG(order_revenue) AS avg_order_value
  FROM orders
  GROUP BY 1
)
SELECT
  COUNT(*) AS customers,
  AVG(num_orders) AS avg_orders_per_customer,
  AVG(total_revenue) AS avg_total_revenue_per_customer,
  AVG(avg_order_value) AS avg_order_value,
  SUM(CASE WHEN num_orders >= 2 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS repeat_customer_rate
FROM customer_agg;
