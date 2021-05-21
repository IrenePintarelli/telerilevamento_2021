# R_code_variability.r

# load the libraries I will need
library(raster)
library(RStoolbox)

# set the working directory
setwd("C:/lab/")

# upload the image in R
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

# PCA
sentpca <- rasterPCA(sent)
plot(sentpca$map)
summary(sentpca$model)
 
pc1 <- sentpca$map$PC1
focal(pc1, w=matrix(1/25, nrow=5, ncol=5),fun=sd)
pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5),fun=sd)
plot(pc1sd5)

# change color
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

# pc1 <- sentpca$map$PC1
# focal(pc1, w=matrix(1/49, nrow=7, ncol=7),fun=sd)
# pc1sd7 <- focal(pc1, w=matrix(1/49, nrow=7, ncol=7),fun=sd)
# plot(pc1sd7)

source("source_test_lezione.r")

#####

# upload the libraries I will need
library(ggplot2)
library(gridExtra)
# install a new package useful for the colors
install.packages("viridis")
library(viridis)

# visualize maps
source("source_ggplot.r")

# with the source function you can upload code from outside
source("source_test_lezione.r")
source("source_ggplot.r")

# use viridis legend
ggplot() + geom_raster(pc1sd5, mapping=aes(x=x, y=y, fill=layer))
ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis() + ggtitle("Standard deviation of PC1 by viridis color scale")
ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis(option="magma") + ggtitle("Standard deviation of PC1 by viridis color scale")
ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis(option="inferno") + ggtitle("Standard deviation of PC1 by viridis color scale")
ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis(option="turbo") + ggtitle("Standard deviation of PC1 by viridis color scale")

# each plot is associated with an object
p0 <- ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis(option="viridis") + ggtitle("Standard deviation of PC1 by viridis color scale")
p1 <- ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis(option="magma") + ggtitle("Standard deviation of PC1 by viridis color scale")
p2 <- ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis(option="inferno") + ggtitle("Standard deviation of PC1 by viridis color scale")
p3 <- ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis(option="turbo") + ggtitle("Standard deviation of PC1 by viridis color scale")

grid.arrange(p0,p1,p2,p3, nrow=2)








