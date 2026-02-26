# Customer Purchase Behavior Segmentation & Market Basket Analysis

## Overview

This project applies unsupervised machine learning and association rule mining techniques to analyze real-world retail transaction data from the UCI Online Retail dataset.

The goal is to extract meaningful customer segments and uncover product associations that can drive business decisions.

---

## Dataset

**Source:** UCI Machine Learning Repository  
**Dataset:** Online Retail  
**Size:** 541,909 transactions  
**Period:** Dec 2010 – Dec 2011  
**Country Coverage:** Primarily UK-based customers

Each transaction contains:
- Invoice number
- Product ID and description
- Quantity
- Invoice timestamp
- Unit price
- Customer ID
- Country

---

## Data Cleaning & Preprocessing

The following steps were performed:

- Removed cancelled transactions (InvoiceNo starting with "C")
- Removed missing Customer IDs
- Removed negative quantities and prices
- Created TotalAmount = Quantity × UnitPrice
- Aggregated data at customer level

Final cleaned dataset:
~397,000 valid transactions

---

## Customer Segmentation (K-Means)

### Features Used
- TotalSpent
- TotalTransactions
- TotalQuantity

### Steps
- Feature scaling
- Elbow method for optimal cluster selection
- K-Means clustering
- Cluster summary analysis

### Results
Identified distinct behavioral customer groups, such as:
- High-value frequent buyers
- Low-frequency high spenders
- Price-sensitive customers
- Occasional buyers

### Business Use Cases
- Targeted marketing
- Customer lifetime value optimization
- Loyalty program personalization

---

## Market Basket Analysis (Apriori)

### Steps
- Transaction-to-item transformation
- Frequent itemset generation
- Association rule mining
- Evaluation using Support, Confidence, Lift

### Example Insight
Strong product relationships such as:
Butter → Bread (High lift)

### Business Use Cases
- Cross-selling
- Bundle recommendations
- Store layout optimization

---

## Tools & Libraries

- R
- dplyr
- readxl
- ggplot2
- cluster
- factoextra
- arules
- arulesViz

---

## Project Structure

```
customer-segmentation-market-basket/
│
├── data/
│   └── online_retail.xlsx
│
├── scripts/
│   ├── customer_segmentation.R
│   └── market_basket_analysis.R
│
├── visuals/
│
└── README.md
```

---

## Key Outcomes

- Built full preprocessing pipeline
- Applied clustering on real transaction data
- Implemented association rule mining
- Translated technical results into business insights

---

## Next Improvements

- RFM segmentation
- PCA dimensionality reduction
- Interactive dashboard (Shiny / Power BI)
- Predictive churn modeling
