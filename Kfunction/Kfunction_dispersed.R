library("spatstat")
library("ggplot2")
library("dplyr")

path_out_iso = "E:/Learn_Manim/Dispersed.csv"

jj <- 0

jj <- jj + 1
centers <- matrix(c(
  -20, -20,
  -20, -10,
  -20, 0,
  -20, 10 ,
  -20, 20,
  -10, -20,
  -10, -10,
  -10, 00,
  -10, 10,
  -10, 20,
  0, -20,
  0, -10,
  0, 0,
  0, 10,
  0, 20,
  10, -20,
  10, -10,
  10, 0,
  10, 10,
  10, 20,
  20, -20,
  20, -10,
  20, 00,
  20, 10,
  20, 20
), ncol = 2, byrow = TRUE)
  
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

