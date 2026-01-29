# Metric Definitions & Validation

This document defines the key business metrics used in the Superstore Sales Analytics project and explains how they were validated to ensure accuracy.

---

## 1. Total Revenue
**Definition:**  
Sum of sales across all order lines.

**Grain:**  
Order-line level.

**Implementation:**  
Power BI measure to ensure dynamic recalculation under filter context.

**Validation:**  
Cross validated total revenue using Excel pivot tables.

---

## 2. Total Profit
**Definition:**  
Sum of profit across all order lines.

**Grain:**  
Order line level.

**Implementation:**  
Power BI measure.

**Validation:**  
Matched profit totals between Power BI and Excel.

---

## 3. Profit Margin %
**Definition:**  
Total Profit divided by Total Revenue.

**Purpose:**  
Measures overall business efficiency and profitability.

**Implementation:**  
Calculated as a measure to avoid incorrect aggregation.

---

## 4. Average Order Value (AOV)
**Definition:**  
Total Revenue divided by number of distinct orders.

**Purpose:**  
Indicates customer spending behavior.

**Implementation:**  
Measure using distinct count of order_id.

---

## 5. Month-over-Month (MoM) Revenue Growth %
**Definition:**  
Percentage change in revenue compared to the previous month.

**Purpose:**  
Tracks growth trends and seasonality.

**Dependency:**  
Requires a complete date table for accurate time intelligence.

---

## 6. Customer Revenue Contribution (Pareto)
**Definition:**  
Cumulative percentage contribution of customers to total revenue.

**Purpose:**  
Identifies revenue concentration and dependency risk.

**Insight:**  
Top 7 customers contributed ~82% of total revenue.

---

## Validation Approach
- Ensured all metrics were calculated at the correct grain
- Avoided calculated columns for aggregations
- Used Excel pivot tables to validate Power BI measures
- Reviewed joins and distinct counts to prevent inflated metrics
