# Business Insights

## Overview

The analysis identified several patterns across sales performance, product contribution, geographic performance, and customer behavior.

---

## 1. Revenue Is Highly Concentrated by Country

The United Kingdom generated approximately:

**$8.17M**

or approximately:

**83.97% of analyzed revenue.**

This indicates that the business's revenue base is heavily concentrated in its UK market.

---

## 2. Revenue Increased Sharply During Autumn 2011

Monthly revenue increased substantially during September, October, and November 2011.

November generated approximately:

**$1.46M**

which was the highest monthly revenue observed in the dataset.

---

## 3. Product Revenue Is Distributed Across Many Products

The top product by revenue was:

**REGENCY CAKESTAND 3 TIER**

with approximately:

**$164K**

in revenue.

The top 50 products collectively represented approximately **20.84%** of total product revenue based on the cumulative product analysis.

---

## 4. Repeat Customers Drive the Majority of Revenue

Repeat customers accounted for:

- **3,059 customers**
- **94.79% of analyzed revenue**

One-time customers accounted for:

- **1,313 customers**
- **5.21% of analyzed revenue**

This shows a strong relationship between repeat purchasing and revenue generation.

---

## 5. High-Frequency Customers Are Valuable

Customers placing 20+ orders represented a relatively small customer group but contributed:

**38.10% of revenue.**

This demonstrates the importance of understanding high-frequency customer behavior.

---

## 6. Customer Revenue Is Concentrated

The highest-ranked customers contribute disproportionately to total customer revenue.

For example, customer `14646` generated:

**$279,489.02**

from:

**77 orders**

and:

**196,719 units.**

---

## 7. RFM Segmentation Reveals Different Customer Behaviors

The RFM analysis identified six major customer groups:

| Segment | Customers | Revenue Share |
|---|---:|---:|
| At Risk | 1,238 | 70.98% |
| Potential Loyalists | 941 | 12.79% |
| Champions | 182 | 5.24% |
| Loyal Customers | 697 | 5.21% |
| New Customers | 869 | 3.44% |
| Inactive | 445 | 2.35% |

The unusually high revenue contribution associated with the At Risk segment makes this group particularly important to investigate further.

---

## 8. Customer Data Has Limitations

A significant number of transactions do not have a CustomerID.

There were approximately:

**135K blank CustomerID rows**

associated with approximately:

**$1.45M in revenue.**

Therefore, customer-level metrics should not be interpreted as representing 100% of total transactional revenue.

This distinction was maintained during the analysis to avoid overstating customer-level conclusions.

---

# Business Opportunities

Based on the analysis, areas that could be investigated further include:

### Customer Retention

Analyze high-value customers whose recent purchasing activity has declined.

### Geographic Expansion

Investigate markets outside the UK based on revenue, order volume, customer count, and AOV.

### Product Strategy

Identify products with strong revenue and unit performance and investigate their purchasing patterns.

### Customer Segmentation

Develop targeted retention and engagement strategies based on RFM segments.

### Data Quality

Improve customer identification coverage to enable more complete customer-level analysis.

---

# Conclusion

The analysis demonstrates how transactional data can be transformed into business intelligence through:

**SQL → Data Modeling → DAX → Power BI → Business Insights**

The project provides a complete analytical workflow rather than focusing only on dashboard visualization.
