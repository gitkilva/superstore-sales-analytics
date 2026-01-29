Running total of revenue over time - 
  WITH daily_revenue AS (
    SELECT
      order_date,
      SUM(sales) AS revenue
    FROM orders
    GROUP BY order_date
  )
  SELECT
    order_date,
    revenue,
    SUM(revenue) OVER (ORDER BY order_date) AS running_total_revenue
  FROM daily_revenue
  ORDER BY order_date;

Latest record per customer (deduplication pattern) - 
  SELECT
    customer_id,
    customer_name,
    updated_at
  FROM (
    SELECT
      customer_id,
      customer_name,
      updated_at,
      ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY updated_at DESC
      ) AS rn
    FROM customers
  ) t
  WHERE rn = 1;

Revenue contribution percentage by category - 
  SELECT
    category,
    SUM(sales) AS total_revenue,
    100.0 * SUM(sales) / SUM(SUM(sales)) OVER () AS revenue_pct
  FROM orders
  GROUP BY category
  ORDER BY revenue_pct DESC;

