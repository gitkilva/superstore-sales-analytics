Total revenue by category -
  SELECT
    category,
    SUM(sales) AS total_revenue
  FROM orders
  GROUP BY category
  ORDER BY total_revenue DESC;

Total revenue by region -
  SELECT
    region,
    SUM(sales) AS total_revenue
  FROM orders
  GROUP BY region
  ORDER BY total_revenue DESC;

Monthly revenue trend -
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS total_revenue
  FROM orders
  GROUP BY month
  ORDER BY month;
