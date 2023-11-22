# Load required libraries
library("spatstat")
library("ggplot2")
library("dplyr")

# Create an empty list to store K-function data (you can also use a data frame)
kaa <- list()

# Set the path for the output CSV file
path_out_iso <- "E:/Learn_Manim/random.csv"

# Initialize a variable jj
jj <- 0

# Increment jj by 1
jj <- jj + 1

# Generate random point coordinates as an example (replace with your data)
centers <- random_matrix <- (matrix(runif(50), ncol = 2)-0.5)*40


# Create a ppp object with an observation window that covers your points
as.ppp <- ppp(centers[, 1], centers[, 2], window = owin(c(-20, 20), c(-20, 20)))

# Check the summary of the point pattern
summary(as.ppp)

# Calculate the K-function
K <- Kest(as.ppp, correction = "all")

# Create a data frame with the desired columns
k_data <- data.frame(r = K$r, Kiso = K$iso, Ktheo = K$theo, Kdev = K$iso - K$theo)

# Add the data frame to your list
kaa[[jj]] <- k_data

# Extract data from the data frame based on your 'ind' variable
ind <- seq(1, nrow(k_data), by = 5)
kaa2 <- k_data[ind, ]

# Plot the K-function
plot(K)

# Calculate the average K-function values if needed
# ...

# Write the results to a CSV file
write.csv(kaa2, file = path_out_iso)