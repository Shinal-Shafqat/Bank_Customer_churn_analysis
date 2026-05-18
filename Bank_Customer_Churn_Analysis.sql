---------------------------- Bank Churn Analysis --------------------------------------------------------------
SELECT * FROM bank_churn
--Q1:what percentage of customers churned in last Six months---
SELECT COUNT(*) AS churned_last_6_months
FROM bank_churn
WHERE churn = 1
AND churn_date >= DATEADD(MONTH, -6, GETDATE());
SELECT 
    COUNT(*) AS churned_last_6_months,
    ROUND(
        100.0 * COUNT(*) / (SELECT COUNT(*) FROM bank_churn)
    , 2) AS churn_percentage
FROM bank_churn
WHERE churn = 1
AND churn_date >= DATEADD(MONTH, -6, GETDATE());

-- Q2: Which segment has highest churn rate?
SELECT 
    products_number,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate
FROM bank_churn
GROUP BY products_number
ORDER BY churn_rate DESC;

SELECT 
    CASE WHEN churn = 1 THEN 'Churned'
         ELSE 'Retained'
    END AS customer_status,
    ROUND(AVG(balance), 2) AS avg_balance,
    ROUND(AVG(estimated_salary), 2) AS avg_salary
FROM bank_churn
GROUP BY churn;
 ---Q4: New customers churn rate:
 SELECT 
    CASE WHEN tenure <= 1 THEN 'New (0-1 year)'
         ELSE 'Established (2+ years)'
    END AS customer_type,
    COUNT(*) AS total,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate
FROM bank_churn
GROUP BY 
    CASE WHEN tenure <= 1 THEN 'New (0-1 year)'
         ELSE 'Established (2+ years)'
    END;
--Q5: Churn by country:
	SELECT 
    country,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned,
    ROUND(100.0 * SUM(churn) / COUNT(*), 2) AS churn_rate
FROM bank_churn
GROUP BY country
ORDER BY churn_rate DESC;

---Stretch Goal risk score-----------
SELECT 
    customer_id,
    tenure,
    balance,
    products_number,
    country,
    CASE 
        WHEN products_number >= 3 THEN 'High Risk'
        WHEN tenure <= 1 AND balance = 0 THEN 'High Risk'
        WHEN country = 'Germany' THEN 'High Risk'
        WHEN tenure BETWEEN 2 AND 4 THEN 'Medium Risk'
        WHEN balance < 50000 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS churn_risk
FROM bank_churn
WHERE churn = 0
ORDER BY churn_risk;
---------------------------------------------- end of project ----------------------------------------------------------