# R code copernicus
# visualizing copernicus data

# install the packages needed
install.packages("ncdf4")
library(raster)
library(ncdf4)

# select the working directory
setwd("C:/lab/")

# change the name of the file
albedo<-raster("albedo.nc")

# load the image with the infos
albedo

# change the colour and plot it
cl <- colorRampPalette(c('light blue','green','red','yellow'))(100) #
plot(albedo, col=cl)

# reduce the dimension of pixels (it takes time) 
# resampling
albedores<-aggregate(albedo,fact=100)
plot(albedores,col=cl)
