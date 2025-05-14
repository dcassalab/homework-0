library(gtools)
library(tidyverse)

# Number of ways to assign 3 medals to 8 runners (order matters)
total_ways <- factorial(8) / factorial(8 - 3)
print(total_ways)

# Number of ways to assign 3 medals to 3 Jamaican runners
jamaica_ways <- factorial(3)
print(jamaica_ways)

# Theoretical probability
prob_jamaica <- jamaica_ways / total_ways
print(prob_jamaica)

set.seed(1)  # For reproducibility

# Vector of runner countries: 3 from Jamaica, 5 from other countries
runners <- c("JAM", "JAM", "JAM", "USA", "CAN", "GBR", "NED", "FRA")

# Run Monte Carlo simulation
B <- 100000
results <- replicate(B, {
  winners <- sample(runners, size = 3, replace = FALSE)
  all(winners %in% c("JAM"))
})

# Estimate probability
monte_carlo_prob <- mean(results)
print(monte_carlo_prob)

# Current menu
entrees <- 6
sides <- 6
drinks <- 2

# Number of combinations: choose 2 sides out of 6
combinations_current <- entrees * choose(sides, 2) * drinks
print(combinations_current)

# Update drink options
drinks <- 3

# Recalculate combinations
combinations_3drinks <- entrees * choose(sides, 2) * drinks
print(combinations_3drinks)

# 6 entrees, 3 drinks, 3 sides from 6
combinations_3sides <- entrees * choose(sides, 3) * drinks
print(combinations_3sides)

# Function: given number of entrees, return total combinations
meal_combinations_by_entree <- function(entree_count) {
  drinks <- 3
  sides <- 6
  return(entree_count * choose(sides, 2) * drinks)
}

# Test from 1 to 12 entree options
entree_range <- 1:12
combinations_by_entree <- sapply(entree_range, meal_combinations_by_entree)

# Print combinations for each entree count
print(combinations_by_entree)

# Find minimum entree count needed to exceed 365
min_entrees <- min(entree_range[combinations_by_entree > 365])
print(min_entrees)

# Function: given number of side options, return total combinations
meal_combinations_by_side <- function(side_count) {
  entrees <- 6
  drinks <- 3
  return(entrees * choose(side_count, 2) * drinks)
}

# Test from 2 to 12 side options
side_range <- 2:12
combinations_by_side <- sapply(side_range, meal_combinations_by_side)

# Print combinations for each side count
print(combinations_by_side)

# Find minimum side count needed to exceed 365
min_sides <- min(side_range[combinations_by_side > 365])
print(min_sides)


