# R_code_variability.r

# load the libraries I will need
library(raster)
library(RStoolbox)

# set the working directory
setwd("C:/lab/")

# load the image in R
sent <- brick("sentinel.png")

# NIR 1, RED 2, GREEN 3
# r=1, g=2, b=3 (composition of default)
# plotRGB(sent,r=1,g=2,b=3,stretch="lin")
plotRGB(sent)
plotRGB(sent,r=2,g=1,b=3,stretch="lin")

# associate the band to the image
nir <- sent$sentinel.1
red <- sent$sentinel.2
green <- sent$sentinel.3

# calculate the vegetation index
ndvi <- (nir-red)/(nir+red)
plot(ndvi)

cl <- colorRampPalette(c("black","white","red","magenta","green"))(100)
plot(ndvi,col=cl)

# standard deviation
focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)

# change color
clsd <- colorRampPalette(c("blue","green","pink","magenta","orange","brown","red","yellow"))(100)
plot(ndvisd3,col=clsd)

# mean ndvi with focal
ndvimean3 <- focal(ndvi, w=matrix(1/169, nrow=13, ncol=13), fun=mean)
plot(ndvimean3)
clsd <- colorRampPalette(c("blue","green","pink","magenta","orange","brown","red","yellow"))(100)
plot(ndvimean3,col=clsd)




