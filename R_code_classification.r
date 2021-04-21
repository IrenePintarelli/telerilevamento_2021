# R_code_classification.r 
# classification of solar images dowloaded from the esa's website

# set the working directory as first
setwd("C:/lab/")

# load the image in R using the function "brick" contained in the library "raster"
# first I insert the library I need
library(raster)
# the image is a a data package 
brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# in order to visualize the image I use the function "plorRGB" to see all the levels
plotRGB(so, 1,2,3, stretch="lin")

# I insert the library "RStoolbox"
library(RStoolbox)

# unsupervised classification
soc <- unsuperClass(so, nClasses=3)
# plot the image, using "unsuperClass" the result can be different it depends on how the software process it
plot(soc$map)

# unsupervised classification with 20 classes
sot <- unsuperClass(so, nClasses=20)
plot(sot$map)

# uniform the image
set.seed(42)

# dowload image from the link https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images
sun <- brick("sun.png")
# unservised classification of the image 
sun <- unsuperClass(sun, nClasses=3)
plot(sun$map)
