# Walmart-Sales-Data-Analysis
An end-to-end retail data analytics project utilizing Python (Pandas &amp; SQLAlchemy) for data pipeline migration and MySQL for advanced business intelligence, exploring customer churn, location-based performance, and viral sales trends
# Walmart End-to-End Data Analytics Project: Python & Advanced SQL

## 📌 Project Overview
This repository contains an end-to-end data analytics project focused on extracting actionable business intelligence from retail transaction data. The project bridges the gap between data engineering and business analysis by leveraging **Python** for initial data manipulation and database pipeline migration, followed by **Advanced MySQL** for deep-dive strategic analysis.

Instead of generic data summaries, this project tackles real-world retail challenges relevant to modern commercial landscapes, including customer churn, localized consumer preferences, payment ecosystem shifts, and operational peak-hour optimizations.

---

## 🛠️ Tech Stack & Technical Skills
* **Data Engineering & Pipeling:** Python 3, Pandas, Jupyter Notebook, SQLAlchemy, PyMySQL
* **Database Management System:** MySQL Workbench
* **Advanced SQL Mastery:** * Window Functions (`RANK() OVER`, `PARTITION BY`, `ORDER BY`)
  * Common Table Expressions (CTEs) & Subqueries
  * Conditional Logic (`CASE WHEN` Statements)
  * Advanced Date/Time Manipulation (`STR_TO_DATE`, `DAYNAME`, `WEEK`, `DAYOFMONTH`)
  * Data Aggregation & Filtering

---

## 📂 Project Architecture & Workflow

1. **Data Ingestion & Cleaning (Python):** Using Pandas, raw transactional data was inspected and cleaned. A database connection engine was established via SQLAlchemy to migrate the clean DataFrame smoothly into a local MySQL instance using the `to_sql(if_exists='replace')` method.
2. **Business Intelligence Querying (MySQL):**
   A dedicated SQL script was developed to query the `walmart_db` database, resolving specific business hypotheses through advanced analytical querying.

---

## 📊 Business Insights & Advanced Analytics

Below are the key strategic business questions explored and solved within this project:

### 1. Operational Peak-Traffic & Workforce Scheduling
* **Objective:** Find the absolute busiest transaction day for each individual store branch and filter out lesser traffic days to optimize cashier staffing.
* **SQL Technique:** Window Functions (`RANK() OVER`) combined with `PARTITION BY branch` wrapped in a Subquery.
* **Impact:** Allows management to eliminate over-staffing on slow days and ensure 100% checkout lane capacity during critical branch peak hours.

### 2. The "Payday vs. Mid-Month" Shopping Cycle
* **Objective:** Assess consumer purchasing power fluctuations by categorizing transactions into month phases (Payday Weeks vs. Mid-Month Dry Periods).
* **SQL Technique:** `CASE WHEN` combined with `DAYOFMONTH()` extraction.
* **Impact:** Provides the marketing team with the exact calendar windows to launch "Mega Sales" or push app notifications when consumer wallet share is at its highest.

### 3. Detecting Social Media "Viral Spikes"
* **Objective:** Identify sudden surges in product category quantities sold mapped against specific calendar weeks.
* **SQL Technique:** Date formatting combined with `WEEK()` grouping.
* **Impact:** Acts as an early-warning supply chain indicator to prevent empty shelves when a product line goes viral on TikTok/Reels.

### 4. E-Wallet vs. Credit Card Consumer Profiling
* **Objective:** Analyze modern digital payment adoption by calculating the average basket size (items per hand) and average price point per item across different checkout methods.
* **SQL Technique:** `AVG()` and numeric decimal rounding via `ROUND()`.
* **Impact:** Helps operations create localized checkout incentives (e.g., offering e-wallet cashback minimum-spend thresholds to increase low basket sizes).

### 5. Local Product Preferences (Geographical Segmentation)
* **Objective:** Determine which product category drives the highest revenue for each specific city market.
* **SQL Technique:** Dual-level grouping with a localized partition rank.
* **Impact:** Informs inventory logistics on exactly what high-margin stock to route to regional distribution hubs based on local demographics.

### 6. The Master Executive Scorecard
* **Objective:** Unify financial scales (`total_revenue`), operational metrics (`total_items_sold`), consumer preferences (`flagship_category`), and peak times (`peak_shopping_day`) into a single high-level dashboard grid for C-suite stakeholders.
* **SQL Technique:** Complex Multi-Table CTE Joins (`WITH ... AS`).

---

## 🚀 How to Replicate and Run This Project

### Prerequisites
Ensure you have Python (with `pandas`, `sqlalchemy`, and `pymysql` installed) and MySQL Server/Workbench set up on your machine.

### Execution Steps
1. **Database Migration:** Open and execute the `walmart_analysis.ipynb` notebook to clean the raw data and establish the automated migration pipeline into your local MySQL instance.
2. **Verify Schema:** Open MySQL Workbench, refresh your schemas, and ensure `walmart_db` contains the populated `walmart` table.
3. **Run Analytics:** Open `walmart_queries.sql` in Workbench, highlight any business question block, and execute it using the query tool to view the live dashboard arrays.
