

call libraries of raster and RStoolbox
library(raster)
library(RStoolbox)

#set working directory,always brackets,quotes C:/lab/ 
setwd("C:/lab/")

#assign to a name with the chosen roadyear using brick (with its source file in doublequotes )
p224r63_2011 <- brick("p224r63_2011_masked.grd")
#call 
p224r63_2011
#raster data composedby pixels..
#blue,green,red,nir
#brick

class      : RasterBrick 
dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
resolution : 30, 30  (x, y)
extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
source     : C:/lab/p224r63_2011_masked.grd 
names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
min values : 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.196277e-02, 4.116526e-03, 2.951000e+02, 0.000000e+00 
max values :    0.1249041,    0.2563655,    0.2591587,    0.5592193,    0.489498

#####utm zone,we have 16 zones,italy is 32 for expl
#central meridian...coordinates in meters
#x distnace from meridian and y distance from equator
#in extent we can read these distances respectively
#names we can see the 7bands

#plot single band...4 million pixels per band
plot(p224r63_2011)

#assign to color that is cl using the colorramppalette(with details of colors singlequote choosed)end with 100

cl <- colorRampPalette(c('black','grey','light grey'))(100) #

#plot it with the color function added
plot(p224r63_2011, col=cl)

####use par function to put bands together
#with the graphical parameter mfrowoption to  to create a matrix of nrows x ncols plots that are filled in by row. mfcol=c(nrows, ncols) fills in the matrix by columns.

par(mfrow=c(2,2))

###assign to colornameitblue with the palette,plot it and attach the band1 and add the color function to the name assigned colorblue

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) #
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) #
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) #
plot(p224r63_2011$B3_sre, col=clr)

# Exercise: plot the final band, namely the NIR, band number 4
# red, orange, yellow
clnir <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(p224r63_2011$B4_sre, col=clnir)

#allbands are assigned different colornames accordingly

 dev.off()
#plot RGB assigning numbers to r,g,b and the stretch that equals doublequoted Lin
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

#### 3 bands per time,we can shift them by 1

###par
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
