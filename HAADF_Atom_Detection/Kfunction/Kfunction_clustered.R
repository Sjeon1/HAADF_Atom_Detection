# This code is designed to make K-function of clustered example


library("spatstat")
library("ggplot2")
library("dplyr")

kaa <- list()

path_out_iso <- "E:/Learn_Manim/clustered.csv"
jj <- 0

jj <- jj + 1
centers <- random_matrix <- (matrix(runif(50), ncol = 2)-0.5)*5
as.ppp <- ppp(centers[, 1], centers[, 2], window = owin(c(-20, 20), c(-20, 20)))
summary(as.ppp)
K <- Kest(as.ppp, correction = "all")
k_data <- data.frame(r = K$r, Kiso = K$iso, Ktheo = K$theo, Kdev = K$iso - K$theo)
kaa[[jj]] <- k_data

ind <- seq(1, nrow(k_data), by = 5)
kaa2 <- k_data[ind, ]
plot(K)

write.csv(kaa2, file = path_out_iso)