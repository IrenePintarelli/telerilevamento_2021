# R_code_classification.r 
# classification of solar images dowloaded from the esa's website

# set the working directory as first
setwd("C:/lab/")

# load the image in R using the function "brick" contained in the library "raster"
# first I insert the library I need
library(raster)
# the image is a data package 
# I load it using the brick function
brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# in order to visualize the image I use the function "plotRGB" to see all the levels
# 1 = NIR
# 2 = RED
# 3 = BLUE
plotRGB(so, 1,2,3, stretch="lin")

# I insert the library "RStoolbox"
# install.packages("RStoolbox") if I haven't downloaded it yet
library(RStoolbox)

# unsupervised classification, the different pixels are gathered in classes according to their spectral caratteristics
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
# unsupervised classification of the image 
sun <- unsuperClass(sun, nClasses=3)
plot(sun$map)

# Download Solar Orbiter data and proceed further
# Grand Canyon: https://landsat.visibleearth.nasa.gov/view.php?id=80948


############################ Dolan Springs ###############################

# load the library I will need
library(raster)
library(RStoolbox)

# load the working directory
setwd("C:/lab/")

# use the function brick to load the image
gc<-brick("dolansprings_oli_2013088_canyon_lrg.jpg")
# visualize the image in RGB (visible light spectrum RED GREEN BLUE)
plotRGB(gc,r=1,g=2,b=3, stretch="Lin")
plotRGB(gc,r=1,g=2,b=3, stretch="Hist")
# to see the differences between the version "Hist" and "Lin" I visualize them together building an empty window with 2 rows and 1 column
par(mfrow=c(2,1))
plotRGB(gc,r=1,g=2,b=3, stretch="Lin")
plotRGB(gc,r=1,g=2,b=3, stretch="Hist")

# unsupervised classification, create 2 classes for the cells
gcc2 <- unsuperClass(gc,nClasses=2)
plot(gcc2$map)

# visualize the original imagine and the processed one
par(mfrow=c(2,1))
plotRGB(gc,r=1,g=2,b=3, stretch="Lin")
plot(gcc2$map)
# add more classes
gcc4 <- unsuperClass(gc, nClasses=4)
plot(gcc4$map)


