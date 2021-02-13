# R_code_energy.r
#### energy flow
# install.packages("rasterdiv")
# iinstall.packages("rasterVis")
library(rasterdiv)
library(raster)
library(rasterVis)

data(copNDVI)
plot(copNDVI)

###c bind,removal of values,na not assigned
##remove values 253,254,255 from 0-255
####8bit is 2exp8 so 256 
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

##rasterdiv package..mean of each pixel
##expl all images from June,each pixel from huge amount of data
#from each pixel u can extract mean biomass from june,mean of all maps in period,longterm ndvi

##to make level plot
levelplot(copNDVI)

clymin <- colorRampPalette(c('yellow','red','blue'))(100) # 
plot(copNDVI, col=clymin)
##color yellow minimum 

clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)
##medium values..lie with colors,map is yellow red blue
#blue is the max energy in this map but doesnt seem like that

clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)
##now we are catching the yellow part,highest biomass highest energy

##put 1row 2 columns
par(mfrow=c(1,2))

clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)

##zoom in certain part with ext for extension
# 0,20 0 for greenwich part...latitude longitude
ext <- c(0,20,35,55)
# xmin xmax ymin ymax

#crop data with extension and assign crop to new name
#give it a name for italy expl
copNDVI_Italy <- crop(copNDVI, ext)

#plot new name with color
plot(copNDVI_Italy, col=clymax)




############second part
##energy
#get data from lab import data in R
#2 manners to import data
##raster func..image with diff layer,mo more raster,it is brick
##importing all satellite images of diff bands
##

##call library
library(raster)
library(RStoolbox)

#set wd
setwd("C:/lab/") 

##### Deforestation example
defor1 <- brick("defor1_.jpg")  
##.jpg or png.jpg
###min value max value
##1bit 2info..2bit,4colors..or 0,1,2,3,
##8bit image 256 per each band
##computer showing image with rgb scheme

plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")

##nir to red..red to green,green to blue
##leaf reflecting a lot in red componenent..vegetation becoming red!!

###import the defor2_.jpg image
defor2 <- brick("defor2_.jpg")  

plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#put images one beside the other with par()
###expl 2 rows and 1 column
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

######river change,water surface reacts
###water is absorbing alot in NIR.image should be black
##also water color depends on sediment for expl huge amount od sediment will be same color as bare soil while smalla mount will be blue going black
###DVI change;(..red needs to produce biomass..while more yellow we have lower capability of the system to do photosynthesis....we want system to produce o2 biomass..:/



###DVI=NIR - RED
###nir high reflect..red low reflect,red highly absorbedplant will absorb most oflight for photosynthesis,only small value of red will be reflecting...
##if there is vegetation..0-255
##expl nir will be high(250) minus(10) red low=(240)huge value,amount of vegetation
##decrease nir and increase red=decreased value..lower value
# dvi for the first period

##defor 1 uses nir,red,green
##names of layer,min layer
[1] "defor1_.1" "defor1_.2" "defor1_.3"

##this pixel minus other same pixel
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
##dollar to link to NIR channel and other dollar to link to RED channel
# dev.off()
plot(dvi1)
#higher biomass...green parts,higher DVI

###change color...before cut image
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
# specifying a color scheme..higher biomass in redish part
plot(dvi1, col=cl)

# dvi2 after cut image!!!

##do same as for first..see layers..subtract one from other
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
###change color also for dvi2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
##we have yellow as medium values...part that changed alot through time
plot(dvi2, col=cl)

#NOW put together!!!put titles with main....put images one beside the other with par()
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

#their difference
###biomass before cut MINUS biomass after cut
###higher the value higher the difference,,higher the change...higher should be the red part
difdvi <- dvi1 -dvi2
###give difference a name 
# dev.off()
###plot difference
plot(difdvi)

##after cut..decreased biomass..amount of biomass lost during the cut...or in other terms is the amount of energy lost!
###higher the change in biomass..higher energy lost

###put in color
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!")

##histogram of value of this map...hist funtion of given data values...how freq is a value to the value diff in the map
hist(difdvi, col="red")

#put all together in par
# defor1
# defor2
# dvi1
# dvi2
# difdvi
# histogram

par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi, col="red")
