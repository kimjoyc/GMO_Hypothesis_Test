# Install the 'mosaic' package if not already installed
install.packages("mosaic")

# Load the 'mosaic' package
require(mosaic)

# Compute summary statistics for the 'GMO' column in the 'Days' dataset
favstats(Days$GMO)

# Compute summary statistics for the 'Non-GMO' column in the 'Days' dataset
favstats((Days$`Non-GMO`))

# Perform a two-sample t-test assuming equal variances between 'GMO' and 'NONGMO' groups
t.test(GMO, NONGMO, alternative = "two.sided", var.equal = TRUE)

# Compute summary statistics for the 'GMO' column
favstats(GMO)

# Compute summary statistics for the 'NONGMO' column
favstats(NONGMO)

# Create a vector 'GMO' with the given data points
GMO <- c(15, 18, 8, 12, 18, 8, 10, 13, 6, 7, 7, 13, 10, 13, 10, 6, 7, 18)

# Create a vector 'NONGMO' with the given data points
NONGMO <- c(16, 18, 8, 10, 12, 18, 17, 7, 15, 9, 17, 11, 18, 8, 17, 13, 7, 8)

# Perform bootstrapping: create 5000 bootstrapped samples and compute the differences in means for each
bootdiff <- do(5000) * (mean(sample(GMO, length(GMO), replace = TRUE)) - mean(sample(NONGMO, length(NONGMO), replace = TRUE)))

# Plot a histogram of the bootstrapped differences in means
hist(bootdiff$result)

# Calculate the difference in means for the original datasets 'GMO' and 'NONGMO'
mydiff <- mean(GMO) - mean(NONGMO)
mydiff

# Create an adjusted bootstrapped distribution by adding the difference in means of the original data to each bootstrapped difference
adj.bootdiff <- sort(bootdiff$result) + 1.66

# Compute summary statistics for the adjusted bootstrapped distribution
favstats(adj.bootdiff)

# Plot a histogram of the adjusted bootstrapped distribution
hist(adj.bootdiff)

# Plot a histogram of the adjusted bootstrapped distribution with custom title and axis labels
hist(adj.bootdiff, main = "Adjusted Bootstrap Distribution of Mean Germination Days", xlab = "Time it took for Germination (Days)")

# Calculate the number of bootstrapped differences greater than or equal to '0 + amount' and less than or equal to '0 - amount'
amount <- abs(0 - 1.66)
sum(adj.bootdiff >= (0 + amount)) + sum(adj.bootdiff <= (0 - amount))

# Calculate the proportion of bootstrapped differences within the specified range
1152/5000

# Order the adjusted bootstrapped differences in ascending order
orderprop <- sort(adj.bootdiff)

# Compute the 95% confidence interval for the adjusted bootstrapped differences
quantile(orderprop, c(0.025, 0.975))
