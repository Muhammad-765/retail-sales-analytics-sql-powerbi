# Retail Sales Analytics — SQL & Power BI

## Turning Retail Transaction Data Into Business Insights

An end-to-end retail sales analytics project using **MySQL, SQL, Power Query, and Power BI** to transform transactional sales data into actionable insights across **sales performance, customers, products, and markets**.

The project covers the complete analytics workflow — from data cleaning and validation to SQL analysis, customer segmentation, revenue concentration analysis, data modeling, DAX measures, and interactive Power BI dashboards.

---

## 📊 Project Overview
<img width="766" height="432" alt="01 Executive Overview" src="https://github.com/user-attachments/assets/7802e693-a534-483e-9d86-961cc9f0574b" />

The objective of this project is to analyze retail transaction data and answer key business questions:

- How is revenue performing over time?
- Which products generate the most revenue?
- Which products sell the highest number of units?
- Which countries contribute the most revenue?
- How frequently do customers purchase?
- How dependent is revenue on repeat customers?
- Which customers generate the highest revenue?
- Which customer segments require attention?
- How concentrated is revenue among customers and products?
- What patterns can be identified to support business decisions?

---

## 🗂️ Dataset

The project uses the **Online Retail dataset**, containing transactional records from a UK-based online retailer.

### Dataset Coverage

| Metric | Value |
|---|---:|
| Raw Transactions | 541,909 |
| Analysis Period | Dec 2010 – Dec 2011 |
| Countries | 38 |
| Products | 3,958 |
| Identified Customers | 4,372 |
| Blank Customer Rows | 135,037 |

The dataset contains transactional information including:

- Invoice number
- Stock code
- Product description
- Quantity
- Invoice date
- Unit price
- Customer ID
- Country

---

## 🔄 Project Workflow

```text
Raw Transaction Data
        ↓
Data Quality Assessment
        ↓
Data Cleaning & Validation
        ↓
MySQL Staging Tables
        ↓
SQL Analysis
        ↓
Analytical Views / Tables
        ↓
Power BI Data Model
        ↓
DAX Measures & KPIs
        ↓
Interactive Dashboard
        ↓
Business Insights
```
## 🧹 Data Preparation
 
The raw dataset was prepared before analysis to improve data quality and analytical reliability.

Key preparation steps included:

- Identifying duplicate transactions
- Handling missing Customer IDs
- Reviewing product descriptions
- Handling invalid quantities
- Reviewing non-positive unit prices
- Identifying cancelled transactions
- Creating calculated revenue
- Validating row counts
- Validating total revenue
- Creating staging tables for analysis

Revenue was calculated using:

Revenue = Quantity × Unit Price

## 🧮 SQL Analysis

The SQL analysis was organized into seven analytical modules.

### 01 — Data Cleaning

Prepared the raw transactional data for analysis using staging tables and data-quality checks.

### 02 — KPI Analysis

Calculated core business metrics including:
- Total Revenue
- Total Orders
- Total Customers
- Units Sold
- Average Order Value
- Revenue per Customer
- Orders per Customer
  
### 03 — Monthly Analysis

Analyzed business performance over time using:
- Monthly Revenue
- Monthly Orders
- Monthly Customers
- Average Order Value
- Revenue per Customer
- Orders per Customer
- Month-over-Month Revenue Growth
  
### 04 — Product Analysis

Analyzed product-level performance using:
- Units Sold
- Product Revenue
- Revenue Ranking
- Top Products
- Cumulative Product Revenue
  
### 05 — Country Analysis

Compared markets using:
- Revenue
- Orders
- Customers
- Average Order Value
  
### 06 — Customer Analysis

Analyzed customer behavior using:
- Customer Revenue
- Order Frequency
- Average Order Value
- Repeat vs One-Time Customers
- Customer Revenue Ranking
- RFM Analysis
- Customer Segmentation
  
### 07 — Advanced Analysis

Extended the analysis with:
- Revenue concentration
- Customer revenue ranking
- Product revenue ranking
- RFM scoring
- High-value customer identification
- Customer frequency groups
- Revenue contribution analysis
  
## 👥 Customer Analysis
<img width="769" height="429" alt="03 Product   Market Performance" src="https://github.com/user-attachments/assets/d0b8decf-bcb6-4f72-8dd7-7f671a12571e" />

Customer behavior was analyzed using both purchase frequency and RFM methodology.

### RFM Analysis

RFM represents:
- Recency — How recently a customer purchased
- Frequency — How often a customer purchased
- Monetary Value — How much revenue the customer generated

Customers were scored from 1–5 across the three dimensions and grouped into meaningful customer segments.

### Customer Segments
The analysis identified:
| Segment             | Customers | Customer Share | Revenue Share |
| ------------------- | --------: | -------------: | ------------: |
| At Risk             |     1,238 |         28.32% |        70.98% |
| Potential Loyalists |       941 |         21.52% |        12.79% |
| Champions           |       182 |          4.16% |         5.24% |
| Loyal Customers     |       697 |         15.94% |         5.21% |
| New Customers       |       869 |         19.88% |         3.44% |
| Inactive            |       445 |         10.18% |         2.35% |

## 🔁 Customer Frequency Analysis

Customers were also grouped according to their number of orders.
| Order Frequency | Customers | Revenue Share |
| --------------- | --------: | ------------: |
| 1 Order         |     1,313 |         5.21% |
| 2–5 Orders      |     1,972 |        21.66% |
| 6–10 Orders     |       628 |        17.20% |
| 11–20 Orders    |       317 |        17.82% |
| 20+ Orders      |       142 |        38.10% |

This analysis helps identify how purchasing frequency relates to revenue contribution.

## 📈 Power BI Dashboard

The final Power BI report contains three analytical pages.

### 01 — Executive Overview

Provides a high-level view of:
- Revenue
- Orders
- Customers
- Average Order Value
- Repeat Customer %
- Revenue by Country
- Top Products
- Customer Segments
- Monthly Revenue Trend

### 02 — Customer Intelligence
<img width="765" height="430" alt="02 Customer Intelligence" src="https://github.com/user-attachments/assets/51540624-9237-4311-9c5b-2a5a3e823433" />

Focuses on customer behavior and value.

Includes:
- Repeat vs One-Time Customers
- Top Customers by Revenue
- Customer Frequency vs Revenue
- Revenue by Customer Segment
- Customer Revenue Concentration
- High-Value Customers with Low Recency
- Customer-Level Metrics

### 03 — Product & Market Analysis

Analyzes product and market performance.

Includes:
- Top Products by Revenue
- Top Products by Units Sold
- Product Volume vs Revenue
- Average Order Value by Market
- Top Markets by Revenue
- Product Revenue Contribution

## 📌 Key Business Metrics

The final Power BI model reports:
| KPI                  |  Value |
| -------------------- | -----: |
| Total Revenue        | 10.64M |
| Total Orders         |    20K |
| Total Customers      |     4K |
| Average Order Value  | 533.17 |
| Repeat Customer Rate |    66% |
| Revenue per Customer |  2.45K |

## 🔎 Key Findings
### Repeat customers drive the majority of revenue

Repeat customers represent approximately 66% of identified customers while contributing approximately 94.79% of customer-attributed revenue.

### High-frequency customers contribute substantial revenue

Customers with 20+ orders represent a relatively small customer group but contribute approximately 38.10% of revenue.

### One-time customers contribute a smaller share of revenue

Customers with only one recorded order account for approximately 5.21% of revenue.

### Revenue is concentrated among specific customer segments

The RFM analysis shows that the At Risk segment contains a large share of customers and represents approximately 70.98% of analyzed customer revenue.

### Late-year revenue increased substantially

Revenue increased strongly during September–November 2011, with November 2011 reaching approximately 1.46M, the highest monthly revenue in the analyzed period.

## 💡 Business Recommendations

Based on the analysis, several areas can be investigated:

### Customer Retention

Focus on understanding and re-engaging customers classified as At Risk.

### Repeat Purchase Strategy

Develop strategies to encourage one-time and low-frequency customers to make additional purchases.

### High-Value Customer Management

Monitor customers with high revenue contribution and strong purchasing activity.

### Product Strategy

Use product revenue and unit-volume analysis to support inventory, merchandising, and promotional decisions.

### Market Analysis

Compare market-level revenue, customer activity, and order behavior when evaluating regional opportunities.

## 🛠️ Tools Used
- MySQL
- SQL
- Power Query
- Power BI
- DAX
- Excel
- GitHub
  
## SQL Techniques
- CTEs
- Window Functions
- Aggregations
- CASE Statements
- Date Functions
- Ranking
- Revenue Contribution
- RFM Analysis
- Data Validation

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

The final solution transforms transactional retail data into an interactive analytical tool that can be used to understand sales performance, customer behavior, product contribution, and market performance.

## 👤 Author

### Muhammad

Business Data Analytics Student | Data Analytics | SQL | Power BI | Tableau | Python

LinkedIn • GitHub
