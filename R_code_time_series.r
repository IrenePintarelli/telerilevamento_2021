# Time series analysis
# Greenland increase of temperature
# Data and Code from Emanuela Cosma

# install.packages("raster") e ("rasterVis")
library(raster)
library(rasterVis)
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
plot(TGr)TGr<-stack(import)
plot(TGr)

# use RGB
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
plotRGB(TGr, 4, 3, 2, stretch="Lin")
 
# create a single plot with all images
levelplot(TGr)

# change colours
cl <- colorRampPalette(c("blue","light blue","green","yellow"))(100)
levelplot(TGr, col.regions=cl)
# name the 4 blocks 
levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
# give a title 
levelplot(TGr,col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

# new data which represent ice melting in time
# creta list of files and plot all the files together
meltlist <- list.files(pattern="melt")
melt_import <- lapply(meltlist,raster)
melt <- stack(melt_import)
melt
levelplot(melt)

# creta a file to show the difference of melt ice between 2 different years (in the beginning and in the end of the period of observation)
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)
levelplot(melt_amount, col.regions=clb)






