# This code is designed to calculate K-function from the detection result derived from the code AtomDetection_ACSTEM https://github.com/HPAI-BSC/AtomDetection_ACSTEM.

library("spatstat")
library("ggplot2")
library("dplyr")

kaa <- list()
kaa2 <- list()



# cryo
path_csv <- file.path(dirname(getwd()), "Atom_Detection_Demo/data/detection_data/dl_detection_ReBubpy/dl_detection_ReBubpy_0.6/Re_bpy_1h11.csv")
path_out_iso <- file.path(getwd(),"Kfunction_ReBubpy_iso.csv")
path_out_border <- file.path(getwd(),"Kfunction_ReBubpy_border.csv")

z <- list()

df1 = read.csv(path_csv)
z <- df1[, c("x", "y")]
as.ppp <- ppp(x = df1$x, y = df1$y, c(0,1023), c(0,1023))
  
plot(as.ppp)
  
K <- Kest(as.ppp, correction="all")
kaa <- K$border-K$theo
kaa2 <- K$iso-K$theo
  
plot(K, sqrt(iso-theo/pi) ~ r)

write.csv(kaa, file = path_out_border)
write.csv(kaa2, file = path_out_iso)

