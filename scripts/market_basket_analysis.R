# -----------------------------
# Market Basket Analysis (Apriori)
# -----------------------------

library(readxl)
library(dplyr)
library(arules)
library(arulesViz)

# Load dataset
data <- read_excel("data/online_retail.xlsx")

# Clean
data <- data %>%
  filter(!is.na(CustomerID),
         Quantity > 0)

# Convert to transaction format
basket <- data %>%
  group_by(InvoiceNo) %>%
  summarise(items = list(unique(Description)))

transactions <- as(
  split(data$Description, data$InvoiceNo),
  "transactions"
)

# Apply Apriori
rules <- apriori(
  transactions,
  parameter = list(support = 0.01,
                   confidence = 0.5,
                   minlen = 2)
)

# View top rules
inspect(head(sort(rules, by = "lift"), 10))

# Plot
plot(rules, method = "graph", engine = "htmlwidget")