# =====================================================
# Customer Segmentation with RFM + K-Means Clustering
# =====================================================

library(dplyr)
library(ggplot2)
library(cluster)
library(factoextra)

set.seed(123)

# -----------------------------------------------------
# Simulate Realistic Customer Data
# -----------------------------------------------------

customer_data <- data.frame(
  CustomerID = 1:300,
  TotalSpend = abs(rnorm(300, mean = 2000, sd = 800)),
  Frequency = rpois(300, lambda = 15),
  AvgBasketSize = abs(rnorm(300, mean = 5, sd = 2)),
  Recency = runif(300, 1, 365)
)

# -----------------------------------------------------
# RFM Feature Engineering
# -----------------------------------------------------

customer_data <- customer_data %>%
  mutate(
    R_score = ntile(Recency, 4),
    F_score = ntile(Frequency, 4),
    M_score = ntile(TotalSpend, 4)
  )

customer_data$RFM_Score <-
  customer_data$R_score * 100 +
  customer_data$F_score * 10 +
  customer_data$M_score

# -----------------------------------------------------
# Prepare Features for Clustering
# -----------------------------------------------------

scaled_data <- scale(
  customer_data[, c(
    "TotalSpend",
    "Frequency",
    "AvgBasketSize",
    "Recency",
    "RFM_Score"
  )]
)

# -----------------------------------------------------
# Determine Optimal Clusters (Elbow Method)
# -----------------------------------------------------

png("visuals/elbow_plot.png", width = 800, height = 600)
fviz_nbclust(scaled_data, kmeans, method = "wss") +
  ggtitle("Elbow Method for Optimal Clusters")
dev.off()

# -----------------------------------------------------
# Apply K-Means
# -----------------------------------------------------

kmeans_model <- kmeans(scaled_data, centers = 4, nstart = 25)

customer_data$Cluster <- kmeans_model$cluster

# -----------------------------------------------------
# Silhouette Evaluation
# -----------------------------------------------------

sil <- silhouette(kmeans_model$cluster, dist(scaled_data))
avg_silhouette <- mean(sil[, 3])

print(paste("Average Silhouette Score:",
            round(avg_silhouette, 3)))

# -----------------------------------------------------
# Save Cluster Visualization
# -----------------------------------------------------

png("visuals/cluster_plot.png", width = 800, height = 600)
fviz_cluster(kmeans_model,
             data = scaled_data,
             ellipse.type = "convex",
             ggtheme = theme_minimal()) +
  ggtitle("Customer Segmentation using K-Means with RFM")
dev.off()

# -----------------------------------------------------
# Cluster Summary Statistics
# -----------------------------------------------------

cluster_summary <- customer_data %>%
  group_by(Cluster) %>%
  summarise(
    Avg_Spend = mean(TotalSpend),
    Avg_Frequency = mean(Frequency),
    Avg_Basket = mean(AvgBasketSize),
    Avg_Recency = mean(Recency),
    Avg_RFM = mean(RFM_Score)
  )

print(cluster_summary)