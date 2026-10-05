SELECT
    customer_id,
    order_date,
    COUNT(*) AS sales,
    LAG(COUNT(*)) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_sales
FROM orders
GROUP BY customer_id, order_date;