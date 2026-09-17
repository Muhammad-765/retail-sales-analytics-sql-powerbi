# Data Cleaning & Preparation

## Overview

The raw retail transaction dataset was prepared in MySQL before performing analytical queries.

The objective of the cleaning stage was to improve data quality, create consistent analytical fields, and prepare a reliable dataset for downstream sales, product, country, and customer analysis.

---

## Raw Data

The dataset contains transaction-level retail records with fields including:

- InvoiceNo
- StockCode
- Description
- Quantity
- InvoiceDate
- UnitPrice
- CustomerID
- Country

The original dataset contained more than 500K transaction records.

---

## Cleaning Process

### 1. Staging Table

A staging table was created to preserve the raw dataset while allowing transformations to be performed safely.

```sql
CREATE TABLE sales_staging AS
SELECT *
FROM sales;
```
### 2. Duplicate Detection

Duplicate records were investigated before analytical processing.

Duplicate detection was performed using combinations of relevant transaction fields.

The purpose was to ensure that duplicate transactions did not artificially inflate revenue, units, or order counts.

### 3. Missing Customer IDs

Customer IDs were not available for every transaction.

The analysis identified:
- Blank Customer Rows: 135,037
- Actual Customers: 4,372
- Revenue associated with blank Customer IDs: approximately $1.45M
- Orders associated with blank Customer IDs: 3,710

Because customer-level analysis requires an identifiable customer, records without CustomerID were excluded from customer-specific analysis.

However, these transactions were retained when calculating overall sales metrics where appropriate.

### 4. Revenue Calculation

A revenue field was derived from:

Revenue = Quantity × UnitPrice
This calculated field became the primary metric for revenue analysis.

### 5. Transaction Validation

Transaction records were examined for:
- Invalid quantities
- Invalid prices
- Missing values
- Non-sales transactions
- Customer identifier availability

The cleaned dataset was then used for analytical staging tables.

## Analytical Preparation

The cleaned data was used to create analytical datasets/views for:
- Sales analysis
- Product analysis
- Country analysis
- Customer analysis

These analytical outputs were subsequently connected to Power BI.

## Data Quality Checks

Key validation metrics included:
| Check               |  Result |
| ------------------- | ------: |
| Total Revenue       |  $9.73M |
| Total Units         |   5.16M |
| Total Orders        |  25,900 |
| Products            |   3,958 |
| Countries           |      38 |
| Blank Customer Rows | 135,037 |

## Outcome

The cleaning stage produced a consistent dataset suitable for SQL analysis and Power BI reporting while keeping customer-level limitations explicit.
