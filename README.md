# Customer Purchase Behavior Segmentation & Market Basket Analysis

## Overview
This project applies unsupervised machine learning and association rule mining techniques to analyze retail customer purchasing behavior.

The objective is to:
- Segment customers based on purchasing patterns
- Discover product associations
- Translate analytical results into business insights

---

## Customer Segmentation (K-Means)

### Steps Performed
- Feature scaling
- Elbow Method to determine optimal clusters
- K-Means clustering (k = 4)
- Cluster visualization

### Insights
- Identified distinct customer groups based on spending and frequency
- Generated cluster-level summary statistics
- Demonstrated potential for targeted marketing strategies

---

## Market Basket Analysis (Apriori)

### Steps Performed
- Transaction data transformation
- Apriori algorithm implementation
- Evaluation using Support, Confidence, and Lift
- Rule visualization

### Insights
- Identified high-confidence product pairings
- Detected strong lift relationships (e.g., Butter → Bread)
- Demonstrated cross-selling opportunities

---

## Tools & Libraries
R  
dplyr  
ggplot2  
cluster  
factoextra  
arules  
arulesViz  

---

## Business Applications
- Targeted marketing campaigns
- Cross-selling recommendations
- Inventory optimization
- Customer loyalty strategy development