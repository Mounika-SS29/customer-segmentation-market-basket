# -----------------------------
# Customer Segmentation (RFM + K-Means)
# -----------------------------

library(readxl)
library(dplyr)
library(ggplot2)
library(cluster)
library(factoextra)

# Load dataset
data <- read_excel("data/online_retail.xlsx")

# Data Cleaning
data <- data %>%
  filter(!is.na(CustomerID),
         Quantity > 0,
         UnitPrice > 0)

# Convert InvoiceDate
data$InvoiceDate <- as.POSIXct(data$InvoiceDate)

# Create Total Spend column
data$TotalSpend <- data$Quantity * data$UnitPrice

# Snapshot date (one day after last transaction)
snapshot_date <- max(data$InvoiceDate) + 1

# RFM Calculation
rfm <- data %>%
  group_by(CustomerID) %>%
  summarise(
    Recency = as.numeric(snapshot_date - max(InvoiceDate)),
    Frequency = n_distinct(InvoiceNo),
    Monetary = sum(TotalSpend)
  )

# Scale RFM
rfm_scaled <- scale(rfm[,2:4])

# Determine optimal clusters (Elbow Method)
fviz_nbclust(rfm_scaled, kmeans, method = "wss")

# K-Means Clustering
set.seed(123)
kmeans_model <- kmeans(rfm_scaled, centers = 4, nstart = 25)

rfm$Cluster <- as.factor(kmeans_model$cluster)

# Visualize clusters
fviz_cluster(kmeans_model, data = rfm_scaled)

# Cluster summary
cluster_summary <- rfm %>%
  group_by(Cluster) %>%
  summarise(
    Avg_Recency = mean(Recency),
    Avg_Frequency = mean(Frequency),
    Avg_Monetary = mean(Monetary),
    Customers = n()
  )

print(cluster_summary)