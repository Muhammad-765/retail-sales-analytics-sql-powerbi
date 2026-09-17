# Power BI Data Model

## Overview

The cleaned SQL outputs were imported into Power BI and organized into a structured analytical model.

The model was designed to support interactive reporting across sales, products, countries, time, and customers.

---

## Model Structure

The primary transactional table is:

```text
FactSales
```

Supporting dimensions include:
- DimCustomer
- DimProduct
- DimCountry
- DimDate
```
                 DimDate
                    │
                    │
DimProduct ───── FactSales ───── DimCustomer
                    │
                    │
               DimCountry
```
## FactSales

The fact table contains transaction-level sales information.

Important fields include:
- InvoiceNo
- StockCode
- InvoiceDate
- Quantity
- UnitPrice
- Revenue
- CustomerID
- Country

### DimCustomer

Contains unique customer identifiers used for customer-level analysis.

Relationship:
DimCustomer[CustomerID]
          ↓
FactSales[CustomerID]

Customer records with blank CustomerID cannot participate in customer-level relationship analysis.

### DimProduct

Contains product-level information such as:

- StockCode
- Description

Relationship:
DimProduct[StockCode]
          ↓
FactSales[StockCode]

### DimCountry

Contains country-level information used for geographical analysis.

### DimDate

The date dimension supports:
- Year
- Month
- Month Name
- Date-based filtering
- Monthly revenue analysis
- Monthly order analysis
- Time-series visuals
- Analytical Tables / Views

Five analytical model tables/views were created for Power BI.

These outputs provide summarized analytical data for the dashboard while the transactional fact table remains available for detailed calculations.

Relationships

The model uses dimension-to-fact relationships to allow filters from dimensions to propagate into the transactional data.

This structure supports:
- Customer filtering
- Product filtering
- Country filtering
- Date filtering
- Cross-filtering between dashboard visuals
- Power BI Measures

DAX measures were created for major KPIs including:
- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Revenue per Customer
- Orders per Customer
- Product Revenue
- Customer Revenue
- Revenue Rank
- Customer Revenue Rank
- Revenue Share
- Cumulative Revenue %
- Data Validation

Power BI results were compared against SQL outputs to validate the model.

Validation included:
- Revenue totals
- Row counts
- Minimum revenue
- Maximum revenue
- Product revenue
- Customer revenue
- Country revenue

This helped ensure that the dashboard calculations were consistent with the SQL analysis.
