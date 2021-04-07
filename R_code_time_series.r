# Time series analysis
# Greenland increase of temperature
# Data and Code from Emanuela Cosma

# install.packages("raster")
library(raster)
setwd("C:/lab/greenland")

# import the first dataset 
lst_2000<-raster("lst_2000.tif")
# visualize the image
plot(lst_2000)
# import all other images
lst_2005<-raster("lst_2005.tif")
plot(lst_2005)
lst_2010<-raster("lst_2010.tif")
lst_2015<-raster("lst_2015.tif")

# create a panel to visualize 4 images together in order to see the variation in time
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# list of files
list.files()

rlist <- list.files(pattern="lst")
rlist

import<-lapply(rlist,raster)
import

# create a block of files 
TGr<-stack(import)
plot(TGr)

# use RGB
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
plotRGB(TGr, 4, 3, 2, stretch="Lin")
