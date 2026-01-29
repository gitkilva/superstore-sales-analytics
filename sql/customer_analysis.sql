Top 10 customers by revenue -
  SELECT
    customer_name,
    SUM(sales) AS total_revenue
  FROM orders
  GROUP BY customer_name
  ORDER BY total_revenue DESC
  LIMIT 10;

Revenue per customer -
  SELECT
    customer_name,
    SUM(sales) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
  FROM orders
  GROUP BY customer_name
  ORDER BY total_revenue DESC;

Customer revenue ranking (Pareto setup) -
  SELECT
    customer_name,
    SUM(sales) AS total_revenue,
    DENSE_RANK() OVER (ORDER BY SUM(sales) DESC) AS revenue_rank
  FROM orders
  GROUP BY customer_name
  ORDER BY revenue_rank;
