# My first code in R for remote sensing

# install.packages("raster")

setwd("C:/lab/")
library(raster)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011)

# colour change
cl<-colorRampPalette(c("black","grey","light grey")) (100)
plot(p224r63_2011,col=cl)

# colour change new
cl<-colorRampPalette(c("blue","green","yellow","red","magenta")) 
plot(p224r63_2011,col=cl)

# Landsat bands
# B1: Blue
# B2: Green
# B3: Red
# B4: near infrared
# B5: medium infrared
# B6: thermal infrared

# dev.off will clean the current graph
dev.off()

# plot band 1 with a predefined colour ramp palette
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B1_sre,col=cl)

# two plots on the same page
# 1 row, 2 columns
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 row, 1 columns
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# plot the first 4 bands of Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)
# for a better visualization I change the number of rows and columns
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# I create different colour bands
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)
clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)

# Visualizing data by RGB plotting

# Landsat bands
# B1: Blue
# B2: Green
# B3: Red
# B4: near infrared
# B5: medium infrared
# B6: thermal infrared

plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

pdf("primo_pdf_r")
par(mfrow=c(2,2))
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
dev.off()

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

# par natural colours, flase colours, and flase colours with histogram stretch
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

# install a new package
install.packages("RStoolbox")





