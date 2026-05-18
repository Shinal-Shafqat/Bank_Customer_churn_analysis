# 🏦 Bank Customer Churn Analysis
### SQL Project | MS SQL Server

---

## 📌 Project Overview

This project analyzes customer churn behavior at a bank using SQL.  
The goal is to identify **which customers are leaving**, **why they are leaving**, and **which active customers are at risk** of leaving next.

This type of analysis is widely used at banks like **RBC, TD, and Scotiabank** to build retention strategies and reduce customer loss.

---

## 📂 Dataset

**Source:** Kaggle — Bank Customer Churn Prediction  
**Link:** https://www.kaggle.com/datasets/gauravtopre/bank-customer-churn-dataset  
**Rows:** 10,000 customers  
**Tool Used:** Microsoft SQL Server (SSMS 2012)

| Column | Description |
|---|---|
| customer_id | Unique customer ID |
| credit_score | Customer credit score |
| country | France, Germany, Spain |
| gender | Male / Female |
| age | Customer age |
| tenure | Years with the bank |
| balance | Account balance |
| products_number | Number of bank products used |
| credit_card | Has credit card (1/0) |
| active_member | Is active (1/0) |
| estimated_salary | Estimated salary |
| churn | Left the bank (1 = Yes, 0 = No) |

---

## 🎯 Business Questions Answered

1. What percentage of customers churned in the last 6 months?
2. Which customer segment has the highest churn rate?
3. What is the average balance for churned vs retained customers?
4. Are new customers (0-1 year tenure) more likely to churn?
5. Which country has the highest churn rate?
6. ⭐ Stretch Goal: Assign a churn risk score to every active customer

---

## 📊 Key Findings

### 1️⃣ Churn by Product Usage
| Products | Total Customers | Churned | Churn Rate |
|---|---|---|---|
| 4 products | 60 | 60 | **100%** |
| 3 products | 266 | 220 | **82.7%** |
| 1 product | 5,084 | 1,409 | 27.7% |
| 2 products | 4,590 | 348 | **7.6% (Lowest)** |

💡 **Insight:** Customers with 2 products are the most loyal. Customers with 3 or 4 products are overwhelmed and leaving at alarming rates. The bank should focus on moving single-product customers to 2 products rather than pushing 3 or 4.

---

### 2️⃣ Avg Balance — Churned vs Retained
| Status | Avg Balance | Avg Salary |
|---|---|---|
| Churned | **$91,108** | $101,465 |
| Retained | $72,745 | $99,738 |

💡 **Insight:** Churned customers had a **$18,000 higher average balance** than retained customers. This means the bank is losing its most valuable customers — a critical finding. A VIP retention program targeting high-balance customers is recommended.

---

### 3️⃣ Churn by Tenure
| Tenure Group | Total | Churned | Churn Rate |
|---|---|---|---|
| New (0-1 year) | 1,448 | 327 | 22.6% |
| Established (2+ years) | 8,552 | 1,710 | 20.0% |

💡 **Insight:** Tenure alone is not a strong churn predictor. The small 2.6% gap suggests other factors like product count and account balance matter more. This differs from telecom churn where new customers churn 3x more.

---

### 4️⃣ Churn by Country
| Country | Total | Churned | Churn Rate |
|---|---|---|---|
| **Germany** | 2,509 | 814 | **32.4%** |
| Spain | 2,477 | 413 | 16.7% |
| France | 5,014 | 810 | 16.2% |

💡 **Insight:** Germany churns at **double the rate** of France and Spain. This points to a market-specific problem — possibly stronger local competition or poor service in the German market. A targeted Germany retention campaign is recommended.

---

### 5️⃣ Churn Risk Score (Stretch Goal)
Each active customer was assigned a risk label using CASE WHEN logic:

| Risk Label | Criteria |
|---|---|
| 🔴 High Risk | 3+ products OR Germany customer OR new with zero balance |
| 🟡 Medium Risk | Tenure 2-4 years OR balance under $50,000 |
| 🟢 Low Risk | All others — loyal, balanced, France/Spain |

---

## 💼 Business Recommendations

1. **Stop pushing 3+ products** — customers with 3 or 4 products churn at 82-100%. Focus cross-selling at 2 products maximum.
2. **Launch a VIP retention program** — high balance customers are leaving more than low balance ones. Identify them early and offer personalized deals.
3. **Investigate Germany urgently** — 1 in 3 German customers leaves. Research local competitor offers and improve customer service in that market.
4. **Use the risk score table** — the High Risk customer list is ready for the retention team to act on immediately.

---

## 🛠️ SQL Skills Demonstrated

- `CREATE TABLE` / `ALTER TABLE` / `UPDATE` — DDL & DML
- `WHERE`, `GROUP BY`, `ORDER BY` — filtering and grouping
- `SUM()`, `COUNT()`, `AVG()`, `ROUND()` — aggregations
- `CAST()` — data type conversion
- `CASE WHEN` — conditional logic and segmentation
- `DATEADD()`, `GETDATE()` — date arithmetic (MS SQL)
- Subqueries — calculating percentages
- Churn analysis, cohort thinking, customer segmentation

---

## 📁 Files in This Repository

| File | Description |
|---|---|
| `README.md` | Project overview and findings |
| `bank_Custoermr_churn_analysis.sql` | All SQL queries used in this project |

---

## 👤 Author

**Shinal Shafqat**  
Business Intelligence Developer| SQL • Excel • Power BI • Qlikview
📧 Shine.daniel@outlook.com 
🔗 https://www.linkedin.com/in/shinal-shafqat/?skipRedirect=true


Dataset used for educational purposes only.
