# ==============================================
# Market Basket Analysis using Apriori Algorithm
# ==============================================

library(arules)
library(arulesViz)

# ----------------------------------------------
# Create Synthetic Transaction Data
# ----------------------------------------------
transactions_list <- list(
  c("Milk","Bread","Butter"),
  c("Beer","Chips"),
  c("Milk","Bread"),
  c("Bread","Butter"),
  c("Beer","Diapers")
)

transactions <- as(transactions_list, "transactions")

# Summary of transactions
summary(transactions)

# ----------------------------------------------
# Apply Apriori Algorithm
# ----------------------------------------------
rules <- apriori(transactions,
                 parameter = list(
                   supp = 0.2,
                   conf = 0.5,
                   minlen = 2
                 ))

# Sort rules by Lift
sorted_rules <- sort(rules, by = "lift")

# Inspect top 5 rules
inspect(head(sorted_rules, 5))

# ----------------------------------------------
# Save Association Rule Graph
# ----------------------------------------------
png("visuals/association_rules.png", width = 800, height = 600)
plot(sorted_rules, method = "graph",
     control = list(type = "items"))
dev.off()

# ----------------------------------------------
# Rule Summary
# ----------------------------------------------
quality(sorted_rules)