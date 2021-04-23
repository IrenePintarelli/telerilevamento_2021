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

# all the variables of our dataset visualized together
pairs(p224r63_2011)
