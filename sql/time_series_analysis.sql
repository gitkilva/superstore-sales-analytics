Monthly revenue with MoM growth -
  WITH monthly_revenue AS (
    SELECT
      DATE_TRUNC('month', order_date) AS month,
      SUM(sales) AS revenue
    FROM orders
    GROUP BY month
  )
  SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    100.0 * (revenue - LAG(revenue) OVER (ORDER BY month))
      / NULLIF(LAG(revenue) OVER (ORDER BY month), 0) AS mom_growth_pct
  FROM monthly_revenue
  ORDER BY month;

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
