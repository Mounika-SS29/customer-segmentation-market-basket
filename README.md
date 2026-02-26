# Customer Purchase Behavior Segmentation & Market Basket Analysis

## Overview

This project applies unsupervised machine learning and association rule mining techniques to analyze retail customer purchasing behavior.

The analysis combines customer segmentation and market basket analysis to uncover patterns that support data-driven business decisions.

### Objectives

- Segment customers based on purchasing behavior  
- Identify product associations using transaction data  
- Translate analytical findings into actionable business insights  

---

# Customer Segmentation using K-Means

## Methodology

1. Data preprocessing and feature engineering  
2. Feature scaling to standardize variables  
3. Elbow Method to determine optimal number of clusters  
4. K-Means clustering implementation (k = 4)  
5. Cluster visualization and profiling  

## Key Findings

Customers were grouped into distinct behavioral segments based on spending patterns and purchase frequency.

Example segment types:

- High Value Customers – High total spend and frequent purchases  
- Frequent Buyers – Moderate spend with consistent purchasing  
- Occasional Shoppers – Irregular engagement  
- Low Engagement Customers – Low spend and infrequent purchases  

## Business Value

- Enables targeted marketing campaigns  
- Supports personalized promotions  
- Improves customer retention strategies  
- Enhances revenue optimization efforts  

---

# Market Basket Analysis using Apriori

## Methodology

1. Transaction data transformation into itemsets  
2. Association rule mining using the Apriori algorithm  
3. Evaluation using:
   - Support  
   - Confidence  
   - Lift  
4. Rule visualization for interpretability  

## Key Findings

The model identified strong product relationships within customer transactions.

Example insights:

- Butter → Bread shows high confidence  
- Chips ↔ Beer demonstrates strong lift  
- Frequent item pairings highlight bundling opportunities  

## Business Value

- Supports cross-selling strategies  
- Improves product placement decisions  
- Enables bundle pricing optimization  
- Strengthens inventory planning  

---

# Tools & Libraries

- R  
- dplyr  
- ggplot2  
- cluster  
- factoextra  
- arules  
- arulesViz  

---

# Project Structure

```
customer-segmentation-market-basket/
│
├── scripts/
│   ├── customer_segmentation.R
│   └── market_basket_analysis.R
│
└── README.md
```

---

# Business Applications

- Customer segmentation for targeted outreach  
- Cross-selling recommendation systems  
- Inventory optimization  
- Loyalty strategy development  
- Data-driven retail analytics  

---

# Future Improvements

- Apply hierarchical clustering for comparison  
- Use larger real-world retail dataset  
- Integrate predictive modeling  
- Deploy insights into dashboard (Tableau / Power BI)  