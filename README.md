# Retail Sales Analysis — SQL & Power BI

An end-to-end retail analytics project using SQL and Power BI to transform transactional sales data into actionable business insights.

The project covers data cleaning, exploratory analysis, product and country performance, customer behavior, RFM segmentation, revenue concentration, and interactive Power BI reporting.

---

## Project Overview

This project analyzes retail transaction data to understand:

- Overall sales performance
- Revenue and order trends over time
- Product performance
- Country-level sales contribution
- Customer purchasing behavior
- Customer value and revenue concentration
- RFM-based customer segmentation
- Repeat vs. one-time customers
- Order frequency and customer contribution

The analysis was performed using **MySQL** for data preparation and analysis and **Power BI** for data modeling, DAX measures, and interactive visualization.

---

## Business Questions

The project was designed to answer questions such as:

1. How much revenue and how many orders were generated?
2. Which countries contribute the most revenue?
3. Which products generate the highest revenue?
4. How does revenue change month over month?
5. Which customers contribute the most revenue?
6. How concentrated is revenue among customers and products?
7. How many customers are repeat versus one-time buyers?
8. How frequently do customers purchase?
9. Which customer segments represent the largest revenue contribution?
10. Which customers may require retention attention based on RFM behavior?

---

## Dataset

The dataset contains retail transaction-level records including information such as:

- Invoice number
- Stock code
- Product description
- Quantity
- Invoice date
- Unit price
- Customer ID
- Country

The analyzed dataset contains approximately **536K transaction rows** before analytical filtering and processing.

### Key Metrics

| Metric | Value |
|---|---:|
| Total Revenue | $9.73M |
| Total Units Sold | 5.16M |
| Total Orders | 25,900 |
| Customers | 4,373* |
| Products | 3,958 |
| Countries | 38 |
| Average Order Value | $375.52 |
| Average Units per Order | 199.32 |

\*Includes the customer identifier treatment used during the SQL analysis. Detailed customer-data handling is documented separately.

---

# Data Cleaning

The raw transactional data was cleaned and prepared using SQL before analysis.

Key cleaning steps included:

- Removing duplicate records
- Handling missing customer identifiers
- Validating transaction quantities
- Validating unit prices
- Creating calculated revenue fields
- Separating invalid/non-sales records where required
- Creating staging tables for reproducible analysis

Detailed methodology:

[`Documentation/data-cleaning.md`](Documentation/data-cleaning.md)

---

# SQL Analysis

The SQL analysis was organized into multiple analytical stages:

### 01 — Data Cleaning

Preparation and validation of the raw transactional dataset.

### 02 — Exploratory Analysis

Overall business metrics, data validation, and high-level exploration.

### 03 — Sales Analysis

Revenue, orders, customers, monthly performance, AOV, and month-over-month growth.

### 04 — Product Analysis

Product revenue, units sold, product ranking, and revenue concentration.

### 05 — Country Analysis

Country revenue, orders, customers, AOV, revenue share, and cumulative revenue contribution.

### 06 — Customer Analysis

Customer revenue, purchasing frequency, RFM scoring, customer segmentation, and revenue concentration.

Detailed SQL methodology:

[`Documentation/sql-analysis.md`](Documentation/sql-analysis.md)

---

# Power BI Dashboard

The cleaned analytical data was modeled in Power BI using fact and dimension tables.

The dashboard contains three analytical sections:

## 1. Sales Performance

Provides an overview of:

- Revenue
- Orders
- Customers
- Average Order Value
- Monthly revenue trends
- Monthly order trends
- Customer activity
- Revenue growth

## 2. Product & Country Analysis

Examines:

- Product revenue
- Product rankings
- Revenue concentration
- Country revenue
- Country contribution
- Average Order Value by country

## 3. Customer Analysis

Examines:

- Customer revenue
- Customer rankings
- Repeat vs. one-time customers
- Order frequency
- RFM segmentation
- Customer revenue concentration

---

## Dashboard Screenshots

### Sales Performance

<img width="766" height="432" alt="01 Executive Overview" src="https://github.com/user-attachments/assets/e23fde46-aaed-401e-8fc3-c16d10ed1ccb" />


### Product & Country Analysis

<img width="765" height="430" alt="02 Customer Intelligence" src="https://github.com/user-attachments/assets/80fd23cf-2497-43e3-b785-01ed49431e00" />


### Customer Analysis

<img width="769" height="429" alt="03 Product   Market Performance" src="https://github.com/user-attachments/assets/4baee7db-efae-4c5b-b204-7804c8e00c5a" />


---

# Data Model

The Power BI model uses a structured analytical model connecting the transactional fact table with supporting dimension tables.

The model was designed to support:

- Customer analysis
- Product analysis
- Country analysis
- Time-based analysis
- DAX measures
- Interactive filtering

Detailed model documentation:

[`Documentation/data-model.md`](Documentation/data-model.md)

---

# Key Business Insights

Some of the major findings include:

### Revenue Concentration

The United Kingdom generated the majority of total revenue, accounting for approximately **84%** of revenue in the country-level analysis.

### Customer Revenue

Customer revenue is highly concentrated, with a relatively small number of high-value customers contributing a significant portion of sales.

### Repeat Customers

Repeat customers generated approximately **94.8% of analyzed revenue**, compared with approximately **5.2% from one-time customers**.

### Order Frequency

Customers placing **20+ orders** contributed approximately **38.1% of revenue**, despite representing a much smaller customer population.

### Customer Segmentation

RFM analysis revealed substantial differences in customer value and engagement across segments, including At Risk, Potential Loyalists, Champions, Loyal Customers, New Customers, and Inactive customers.

More detailed findings:

[`Documentation/business-insights.md`](Documentation/business-insights.md)

---

# Tools & Technologies

- **MySQL**
- **SQL**
- **Power BI**
- **DAX**
- **Excel**
- **Git & GitHub**

### SQL Techniques

- CTEs
- Window Functions
- Aggregations
- CASE statements
- Date Functions
- Ranking
- Revenue contribution analysis
- RFM analysis
- Data validation

---

# Project Workflow

```text
Raw Transaction Data
        ↓
Data Cleaning & Validation
        ↓
SQL Staging Tables
        ↓
Exploratory Analysis
        ↓
Sales / Product / Country / Customer Analysis
        ↓
Analytical Tables / Views
        ↓
Power BI Data Model
        ↓
DAX Measures & KPIs
        ↓
Interactive Dashboard
        ↓
Business Insights
```
---
## 📂 Repository Structure
```
SQL/
├── 01_data_cleaning.sql
├── 02_kpi_analysis.sql
├── 03_monthly_analysis.sql
├── 04_product_analysis.sql
├── 05_country_analysis.sql
├── 06_customer_analysis.sql
└── 07_advanced_analysis.sql

Power BI/
└── Retail_Sales_Analytics.pbix

Screenshots/
├── 01_executive_overview.png
├── 02_customer_intelligence.png
└── 03_product_market_analysis.png

Documentation/
├── data-cleaning.md
├── sql-analysis.md
├── data-model.md
├── powerbi-dashboard.md
└── business-insights.md
```
## 🎯 Project Outcome

This project demonstrates an end-to-end approach to business data analytics:

#### Raw Data → Data Cleaning → SQL → Business Analysis → Data Modeling → Power BI → Insights

The project focuses not only on calculating metrics, but on using data to understand sales performance, customer value, product contribution, and revenue concentration.

## 👤 Author

### Muhammad

Business Data Analytics Student | Data Analytics | SQL | Power BI | Tableau | Python

LinkedIn • GitHub
