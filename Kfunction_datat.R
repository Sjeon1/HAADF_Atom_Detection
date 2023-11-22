# This code is designed to calculate K-function from the detection result derived from the code AtomDetection_ACSTEM https://github.com/HPAI-BSC/AtomDetection_ACSTEM.

library("spatstat")
library("ggplot2")
library("dplyr")

kaa <- list()
kaa2 <- list()

# cryo
path_csv <- "E:/AtomDetection_ACSTEM-main/data/detection_data/dl_detection_Rebpy/dl_detection_Rebpy_0.2695/"
path_out_iso <- "E:/fig3_plots/Kfunction_sc_cryo_iso.csv"
path_out_border <- "E:/fig3_plots/Kfunction_sc_cryo_border.csv"

z <- list()

jj <- 0
for (ii in 1:25){
  jj = jj + 1
  fni = sprintf("230611_Cryo2_%d.csv", ii)
  df1 = read.csv(paste0(path_csv, fni))
  z <- df1[, c("x", "y")]
  as.ppp <- ppp(x = df1$x, y = df1$y, c(1,1024), c(1,1024))
  
  plot(as.ppp)
  
  K <- Kest(as.ppp, correction="all")
  kaa[[jj]] <- K$border-K$theo
  kaa2[[jj]] <- K$iso-K$theo
  
    plot(K, sqrt(iso-theo/pi) ~ r)
  
}

kav <- kkk / length(r)

write.csv(kaa, file = path_out_border)

write.csv(kaa2, file = path_out_iso)

