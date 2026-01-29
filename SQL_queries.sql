-- =========================================
-- Customer Shopping Behavior Analysis
-- SQL Queries File
-- Each query answers a key business question
-- =========================================

-- Q1: Preview the dataset
-- Purpose: Quickly inspect the first 5 rows to understand structure
SELECT * 
FROM customer
LIMIT 5;

-- Q2: Total revenue by gender
-- Purpose: Identify which gender drives the most revenue
SELECT 
    gender,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY gender;

-- Q3: Customers who used discounts but spent above average
-- Purpose: Determine if high-value customers also use discounts
SELECT 
    customer_id,
    purchase_amount
FROM customer
WHERE discount_applied = 'Yes'
  AND purchase_amount >= (
      SELECT AVG(purchase_amount)
      FROM customer
  );

-- Q4: Top 5 products by average review rating
-- Purpose: Identify highest-rated products for marketing and inventory focus
SELECT 
    item_purchased,
    ROUND(AVG(review_rating), 2) AS avg_rating
FROM customer
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 5;

-- Q5: Average purchase by shipping type
-- Purpose: Compare Standard vs Express shipping to guide logistics or pricing
SELECT 
    shipping_type,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase
FROM customer
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type;

-- Q6: Spend comparison for subscribed vs non-subscribed customers
-- Purpose: Determine if subscriptions increase customer spend and revenue
SELECT 
    subscription_status,
    COUNT(customer_id) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    ROUND(SUM(purchase_amount), 2) AS total_revenue
FROM customer
GROUP BY subscription_status
ORDER BY total_revenue DESC;

-- Q7: Products with highest discount usage
-- Purpose: Identify products where discounts are heavily applied
SELECT 
    item_purchased,
    ROUND(
        100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5;

-- Q8: Customer segmentation based on purchase history
-- Purpose: Segment customers as New, Returning, or Loyal for targeted campaigns
SELECT 
    CASE 
        WHEN previous_purchases = 1 THEN 'New'
        WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
        ELSE 'Loyal'
    END AS customer_segment,
    COUNT(customer_id) AS total_customers
FROM customer
GROUP BY customer_segment;

-- Q9: Top 3 most purchased products within each category
-- Purpose: Identify top products per category for inventory and promotions
WITH item_counts AS (
    SELECT 
        category,
        item_purchased,
        COUNT(customer_id) AS total_orders,
        ROW_NUMBER() OVER (
            PARTITION BY category 
            ORDER BY COUNT(customer_id) DESC
        ) AS item_rank
    FROM customer
    GROUP BY category, item_purchased
)
SELECT 
    category,
    item_purchased,
    total_orders
FROM item_counts
WHERE item_rank <= 3;

-- Q10: Subscription status of repeat buyers
-- Purpose: Check if repeat buyers are more likely to subscribe
SELECT 
    subscription_status,
    COUNT(customer_id) AS repeat_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status;

-- Q11: Revenue contribution by age group
-- Purpose: Identify which age groups generate the most revenue
SELECT 
    age_group,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;
