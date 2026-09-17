# SQL Analysis

## Overview

SQL was used as the primary analytical layer of the project.

The analysis was divided into six SQL stages to keep the workflow organized and reproducible.

---

## 01 — Data Cleaning

`01_data_cleaning.sql`

Responsibilities:

- Create staging tables
- Identify duplicates
- Handle missing values
- Validate quantities and prices
- Create revenue calculations
- Prepare analytical data

---

## 02 — Exploratory Data Analysis

`02_eda.sql`

Key metrics:

- Total revenue
- Total units sold
- Total orders
- Total customers
- Total products
- Total countries
- Average Order Value
- Average Units per Order

### Overall Results

| Metric | Result |
|---|---:|
| Revenue | $9.73M |
| Units | 5.16M |
| Orders | 25,900 |
| Customers | 4,373 |
| Products | 3,958 |
| Countries | 38 |
| AOV | $375.52 |

---

## 03 — Sales Analysis

`03_sales_analysis.sql`

The sales analysis examined performance over time.

Metrics included:

- Monthly revenue
- Monthly orders
- Monthly customers
- Average Order Value
- Revenue per customer
- Orders per customer
- Month-over-month revenue growth

### Highest Revenue Month

November 2011 generated approximately:

**$1.46M**

with:

**3,462 orders**

---

## 04 — Product Analysis

`04_product_analysis.sql`

Product analysis examined:

- Units sold
- Product revenue
- Product ranking
- Revenue contribution
- Cumulative revenue contribution

The highest-revenue product in the analysis was:

**REGENCY CAKESTAND 3 TIER**

with approximately:

**$164,459 revenue**

---

## 05 — Country Analysis

`05_country_analysis.sql`

Country-level analysis examined:

- Revenue
- Revenue share
- Orders
- Customers
- Average Order Value
- Cumulative revenue contribution

The United Kingdom generated approximately:

**$8.17M**

representing approximately:

**83.97% of analyzed revenue.**

---

## 06 — Customer Analysis

`06_customer_analysis.sql`

Customer analysis examined:

- Customer revenue
- Customer ranking
- Revenue concentration
- Order frequency
- Repeat vs. one-time customers
- RFM scores
- Customer segmentation

### Highest-Value Customer

Customer `14646` generated:

- Revenue: **$279,489.02**
- Orders: **77**
- Units: **196,719**

---

## RFM Analysis

Customers were scored using:

### Recency

How recently the customer purchased.

### Frequency

How frequently the customer purchased.

### Monetary

How much revenue the customer generated.

The three scores were combined to create customer segments.

Segments included:

- Champions
- Loyal Customers
- Potential Loyalists
- New Customers
- At Risk
- Inactive

---

## SQL Techniques Used

- CTEs
- Window functions
- `GROUP BY`
- `CASE`
- `JOIN`
- Date functions
- `DATEDIFF`
- `LAG`
- `ROW_NUMBER`
- `RANK`
- Aggregations
- Revenue calculations
- Cumulative percentages
- RFM scoring
