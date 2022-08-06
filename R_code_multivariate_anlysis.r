# R_code_multivariate_anlysis.r

# load the libraries I'll use during the analysis
library(raster)
library(RStoolbox)

# set the working directory
setwd("C:/lab/")

# load the frist image and plot it
p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011)
# visualize the infos about the image
p224r63_2011
# band 1 and band 2 
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)
plot(p224r63_2011$B2_sre,p224r63_2011$B1_sre,col="red", pch=19, cex=2)

# all the variables of our dataset visualized together, to see the correlation between the bands
pairs(p224r63_2011)

# aggregate the cells, this function aggregates the pixels (resampling)
# it depends how much we want the image bigger or smaller
p224r63_2011res <- aggregate(p224r63_2011,fact=10)
# visualizing the info regarding the image I check the variation in the resolution
p224r63_2011res

# in  order to see the differences between the real image and the processed one, I create a window with two rows and plot the images together
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

# PCA analysis = Principal Component Analysis, it shows which layers has the majority of info, the proportion of variance and standard deviation
p224r63_2011res_pca <- rasterPCA(p224r63_2011res)

# produce result summaries of the results of various model fitting functions
summary(p224r63_2011res_pca$model)
# to visualize the model I use the function plot
plot(p224r63_2011res_pca$map)

# visualize 3 components toghether, I assigned to the band of red the firs band and the second to the green one and the third one to the blue
plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="lin")



