# Power BI Dashboard

## Overview

The Power BI dashboard converts the SQL analysis into an interactive business intelligence report.

The dashboard contains three main analytical pages.

---

# Page 1 — Sales Performance

## Purpose

Provides a high-level view of business performance and sales trends.

### KPIs

The page includes:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value

### Analysis

The page analyzes:

- Monthly revenue
- Monthly orders
- Monthly customer activity
- Revenue growth
- Revenue per customer
- Orders per customer

### Key Finding

November 2011 recorded the highest monthly revenue in the analyzed period at approximately **$1.46M**.

---

# Page 2 — Product & Country Analysis

## Purpose

Examines which products and countries contribute to revenue.

### Product Analysis

Visuals include:

- Product revenue
- Product ranking
- Cumulative revenue contribution
- Product performance

### Country Analysis

Visuals include:

- Country revenue
- Revenue contribution
- Orders by country
- Customers by country
- Average Order Value

### Key Finding

The United Kingdom contributed approximately **84% of analyzed revenue**.

---

# Page 3 — Customer Analysis

## Purpose

Analyzes customer value, purchasing behavior, and segmentation.

### Customer Metrics

The dashboard examines:

- Customer revenue
- Revenue rank
- Average Order Value
- Order frequency
- Repeat customers
- One-time customers

### RFM Analysis

Customers were segmented using:

- Recency
- Frequency
- Monetary value

Segments:

- Champions
- Loyal Customers
- Potential Loyalists
- New Customers
- At Risk
- Inactive

### Key Finding

Repeat customers generated approximately **94.8% of analyzed revenue**.

---

# Interactivity

The dashboard supports interactive filtering and cross-analysis through:

- Slicers
- Visual interactions
- Customer filters
- Product filters
- Country filters
- Date filters

---

# DAX

DAX was used to create calculated business metrics and analytical measures.

Examples include:

```text
Total Revenue
Total Orders
Total Customers
Average Order Value
Revenue per Customer
Orders per Customer
Revenue Rank
Customer Revenue Rank
Revenue Share %
Cumulative Revenue %
```

# Dashboard Objective

The final dashboard transforms detailed transactional data into a decision-oriented reporting interface that allows users to move from:

#### Overall performance → Product/Country performance → Customer behavior
