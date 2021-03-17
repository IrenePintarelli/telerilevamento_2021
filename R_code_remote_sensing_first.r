# My first code in R for remote sensing

# install.packages("raster")

setwd("C:/lab/")
library(raster)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)

# colour change
cl<-colorRampPalette(c("black","grey","light grey")) (100)
plot(p224r63_2011,col=cl)

# colour change new
cl<-colorRampPalette(c("blue","green","yellow","red","magenta")) (100)
plot(p224r63_2011,col=cl)
