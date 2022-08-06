# R_code_vegetation_indices.r

# load the librarie
library(raster)

# set the working directory
setwd("C:/lab/")

# use the function brick to load the images in R
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# b1 = NIR, b2 = red, b3 = green
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# visualize the info about the images
defor1
defor2

# different vegetation index 1
dvi1 <- defor1$defor1.1 - defor1$defor1.2
# use plot function to visualize the image
plot(dvi1)

dev.off()

# change colours
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1,col=cl)
# if I want to hide a title
plot(dvi1,col=cl,main="DVI at time 1")

# different vegetation index 2: calculate the difference between the band NIR and band RED, NIR is reflected by the vegetation which adsorbs red
# red is used for photosynthesis so the less is reflected the more vegetation there is
dvi2 <- defor2$defor2.1 - defor2$defor2.2
# use plot function to visualize the image
plot(dvi2)

# change colours
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi2,col=cl)
# if I want to hide a title
plot(dvi2,col=cl,main="DVI at time 2")

# analysis of different vegetation index in time
# in this way I can see in which areas I had the bigger changes in vegetation
difdvi <- dvi1 - dvi2
# change colours
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi,col=cld)

# ndvi, another vegetation index useful to make comparison
# (NIR - RED) / (NIR + RED)
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1,col=cl)

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
plot(ndvi2,col=cl)

# RStoolbox: spectral indices
vi <- spectralIndices(defor1, green = 3, red = 2, nir = 1)
plot(vi, col=cl)

difndvi <- ndvi1 - ndvi2
 
dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)

# install.packages for worldwide
istall.packages("rasterdiv")
library (rasterdiv)

# worldwide visualization
plot(copNDVI)

# install.packages 
install.packages("rasterVis")
library(rasterVis)

# worldwide visualization, how the world breaths, maximum values in the forests, minimum in the deserts and areas covered by ice
levelplot(copNDVI)



