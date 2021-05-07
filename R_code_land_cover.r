# R_code_land_cover.r

# set the working directory
setwd("C:/lab/")

# load the libraries 
library(raster)
library(RStoolbox)

# install a new package
install.packages("ggplot2")
library(ggplot2)

# load the images of the amazon
defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# or

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")


defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

# install a new package
install.packages("gridExtra")
library(gridExtra)

# multiframe with ggplot2 and gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)

# unsupervised classification
d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)

# set.seed() will allow to attain the same result

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)

# classes frequencies in the resulted map 
freq(d1c$map)
# value  count
# [1,]     1 307162
# [2,]     2  34130

# sum the pixels of the first image
s1<- 307162 + 34130
# proportion
prop1 <- freq(d1c$map) / s1
# prop forest: 0.8999977
# prop fields: 0.1000023

# classes frequencies in the resulted map of the second image 
freq(d2c$map)
# value  count
# [1,]     1 179270
# [2,]     2 163456

# sum the pixel of the second image
s2 <- 342726
# proportion
prop2 <- freq(d2c$map) / s2
prop2
# prop forest: 0.5230709 
# prop fields: 0.4769291

# build a dataframe
cover <- c("Forest","Agriculture")
percent_1992 <- c(89.83, 10.16)
percent_2006 <- c(52.06, 47.93)
 
percentages <- data.frame(cover, percent_1992, percent_2006)
percentages

# plot with ggplot, it shows columns with different heights which identify the percentages of forest and agricultural fields
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

# plot the graphs on a single page
p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1, p2, nrow=1)


