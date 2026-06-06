USE walmart_db;
SELECT*FROM walmart;
SELECT COUNT(*) FROM walmart;

-- DROP TABLE walmart;
SELECT 
	payment_method,
    COUNT(*)
FROM walmart
GROUP BY payment_method;
SELECT 
	branch,
	COUNT(DISTINCT branch) as unique_branches
FROM walmart
GROUP BY branch;
SELECT MAX(quantity) FROM walmart;

-- business problem 
-- 	q1 find different payment method and number of transactions, number quantity sold and transaction
SELECT 
	payment_method,
    COUNT(*) as no_payments,
    SUM(quantity) as no_quantity_sold
FROM walmart
GROUP BY payment_method;
-- Q2 identify the highest-rated category in each branch, displayin the branch, category & average rating
SELECT 
    branch,
    category,
    AVG(rating) AS avg_rating,
    RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS `rank`
FROM walmart
GROUP BY branch, category;

-- q3 identify the busiest day for each brang on the number of transactions
SELECT * FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%y')) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS `rank`
    FROM walmart
    GROUP BY branch, day_name
) AS hasil_tapis
WHERE `rank` = 1;
-- q4 calculate the total quantity of items sold per payment methid, list payment method and total quantity
SELECT 
	payment_method,
    COUNT(*) as no_payments,
    SUM(quantity) as no_quantity_sold
FROM walmart
GROUP BY payment_method;

-- q5 payday vs mid-month shopping cycle
SELECT 
    CASE 
        WHEN DAYOFMONTH(STR_TO_DATE(date, '%d/%m/%y')) BETWEEN 25 AND 31 THEN 'Payday Week (End of Month)'
        WHEN DAYOFMONTH(STR_TO_DATE(date, '%d/%m/%y')) BETWEEN 1 AND 5 THEN 'Payday Week (Start of Month)'
        ELSE 'Mid-Month Dry Period'
    END AS month_phase,
    COUNT(*) AS total_transactions
FROM walmart
GROUP BY month_phase
ORDER BY total_transactions DESC;
-- ans: mid month 
-- q6 identify customer churn risk 
SELECT 
    branch,
    MAX(STR_TO_DATE(date, '%d/%m/%y')) AS last_recorded_transaction,
    DATEDIFF(
        (SELECT MAX(STR_TO_DATE(date, '%d/%m/%y')) FROM walmart), 
        MAX(STR_TO_DATE(date, '%d/%m/%y'))
    ) AS days_of_inactivity
FROM walmart
GROUP BY branch
ORDER BY days_of_inactivity DESC;
-- ans: look at days of inactivaty
-- q7 high return risk analysis (product quality control)
SELECT 
    category,
    SUM(quantity) AS total_items_sold,
    ROUND(AVG(rating), 2) AS average_customer_rating,
    CASE 
        WHEN AVG(rating) < 4.0 THEN 'CRITICAL: High Return/Complaint Risk'
        WHEN AVG(rating) BETWEEN 4.0 AND 4.5 THEN 'Stable: Acceptable Quality'
        ELSE 'Excellent: High Customer Loyalty'
    END AS product_health_status
FROM walmart
GROUP BY category
ORDER BY average_customer_rating ASC;
-- ans:everything is excellent  
-- q8 branch performance ranking by basket value
SELECT 
    branch,
    COUNT(*) AS total_sales_tickets,
    ROUND(AVG(unit_price * quantity), 2) AS avg_money_spent_per_ticket,
    RANK() OVER(ORDER BY AVG(unit_price * quantity) DESC) AS branch_rank
FROM walmart
GROUP BY branch;
-- ans WAL017 has the highest total sales tickets