#point pattern analysis
#install spatstat,after rgdal
#install.packages("spatstat")

#when calling library no need for " as its there
library(spatstat)

#set the working directory,using disk name:/lab/,dont forget quotations
setwd("C:/lab/")

# import data
#have the arrow towards the name of dataset <- specified function we want so to read table(source files name with" to say from where we are importing the data
#and header=T to state that there is a column header and this is TRUE)
> covid <- read.table("covid_agg.csv", header=TRUE)

#covid
> covid

#attach function 
> attach(covid)

# let's make a planar point pattern in spatstat
##assign points of x,y ranges to covid planar
#usually longitude is x,lat is y
> covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
# cases, cat, country, lat, lon

#* if you do not use attach(covid):use the dollar sign
#* covids <- ppp(covid$lon, covid$lat, c(-180,180), c(-90,90))
#*unstead of>attach(covid) and  covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

# Now, let's see the density of the covid data!
#density map
> density_map <- density(covid_planar)





#plot that map
> plot(density_map)

#introduce color(s)
#the specified desired colors in the color function

> cl <- colorRampPalette(c('yellow','orange','red'))(100) 
> cl <- colorRampPalette(c('yellow','orange','red'))(100)

#plot the map 
#taking into account the color function 
> plot(density_map, col = cl)


# let's make a planar point pattern in spatstat

#view the points of the planar
> points(covid_planar)

#rgdal use 
#geospatial data library
#open source software ,rgdal is the r version of this library#to make use of polygon data for expl

# Exercise: change the colour of the map
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100) #
plot(density_map, col = cl)
points(covid_planar)


# Putting the countries ontop of the map

#first install the package 
install.packages("rgdal")
Installing package into ‘C:/Users/User/Documents/R/win-library/4.0’
(as ‘lib’ is unspecified)
trying URL 'https://cloud.r-project.org/bin/windows/contrib/4.0/rgdal_1.5-18.zip'
Content type 'application/zip' length 38831001 bytes (37.0 MB)
downloaded 37.0 MB

package ‘rgdal’ successfully unpacked and MD5 sums checked

#call library

library(rgdal)
oading required package: sp
rgdal: version: 1.5-18, (SVN revision 1082)
Geospatial Data Abstraction Library extensions to R successfully loaded
Loaded GDAL runtime: GDAL 3.0.4, released 2020/01/28
Path to GDAL shared files: C:/Users/User/Documents/R/win-library/4.0/rgdal/gdal
GDAL binary built with GEOS: TRUE 
Loaded PROJ runtime: Rel. 6.3.1, February 10th, 2020, [PJ_VERSION: 631]
Path to PROJ shared files: C:/Users/User/Documents/R/win-library/4.0/rgdal/proj
Linking to sp version:1.4-4
To mute warnings of possible GDAL/OSR exportToProj4() degradation,
use options("rgdal_show_exportToProj4_warnings"="none") before loading rgdal.


#import data....readogr of file assign to coastlines
coastlines <- readOGR("ne_10m_coastline.shp")

OGR data source with driver: ESRI Shapefile 
Source: "C:\lab\ne_10m_coastline.shp", layer: "ne_10m_coastline"
with 4133 features
It has 3 fields
Integer64 fields read as strings:  scalerank 


#put colors using palette assigned to color function 
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100)

#plot the density map with color function
plot(density_map, col = cl)
#view points
points(covid_planar, pch = 19, cex = 0.5)
#plot coastlines adding it is true 
plot(coastlines, add = TRUE)

png("figure1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) #
plot(density_map, col = cl)
#view points,pch is to fill,cex is size of points
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()
#png
windows 
      2 


pdf("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) #
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()


#pdf

###### interpolate case data
#assign the cases to store in  the marks of the dataset
marks(covid_planar) <- cases
#smooth function of dataset assign to create a map of the cases
cases_map <- Smooth(covid_planar)
## Warning message:
Least Squares Cross-Validation criterion was minimised at right-hand end of interval [0.323, 27.7]; use arguments ‘hmin’, ‘hmax’ to specify a wider interval for bandwidth ‘sigma’ 

[0.323, 27.7]; use arguments ’hmin’, ’hmax’ to specify a wider interval for bandwidth ’sigma’
#plot the created map with color
plot(cases_map, col = cl)
#view th points of dataset
points(covid_planar)
#plot coastlines adding that it is true
plot(coastlines, add = T)

#####
install.packages("sf")
#package ‘e1071’ successfully unpacked and MD5 sums checked
package ‘classInt’ successfully unpacked and MD5 sums checked
package ‘DBI’ successfully unpacked and MD5 sums checked
package ‘units’ successfully unpacked and MD5 sums checked
package ‘sf’ successfully unpacked and MD5 sums checked


#The downloaded binary packages are in
        C:\Users\User\AppData\Local\Temp\RtmpeyPw0D\downloaded_packages

#call the library,no need for quotes

library(sf)
## Linking to GEOS 3.8.0, GDAL 3.0.4, PROJ 6.3.1
Spoints <- st_as_sf(covid, coords = c("lon", "lat"))
cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)
^^^^^
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)
## Warning in plot.sf(Spoints, cex = Spoints$cases/10000, col = "purple3", : ignoring all
but the first attribute
8

library(rgdal)
# put a smoother to the coastlines by resampling
coastlines <- readOGR("ne_10m_coastline.shp")
#OGR data source with driver: ESRI Shapefile 
Source: "C:\lab\ne_10m_coastline.shp", layer: "ne_10m_coastline"
with 4133 features
It has 3 fields
Integer64 fields read as strings:  scalerank 

#thinga to remember when plot(coastlines, add=T)when adding colors in pallette use '...
plot(coastlines, add=T)
cases_map



*import leo data
#set working directory to disk name then signs lab closed all with quotes
setwd(":C/lab/")

> leo<- read.table("dati_zabotti.csv", header=T,sep=",")
> attach(leo)
> library(spatstat)
> 
> summary(leo)
       x                 y                 t              chlh        
 Min.   :2301708   Min.   :5009151   Min.   :16.30   Min.   : 0.7606  
 1st Qu.:2303334   1st Qu.:5014845   1st Qu.:18.40   1st Qu.: 1.1382  
 Median :2309660   Median :5029621   Median :20.21   Median : 1.3955  
 Mean   :2310653   Mean   :5028168   Mean   :19.65   Mean   : 2.6112  
 3rd Qu.:2316626   3rd Qu.:5039009   3rd Qu.:20.76   3rd Qu.: 2.6832  
 Max.   :2323785   Max.   :5044207   Max.   :21.38   Max.   :13.1886  
      chls        
 Min.   : 0.5698  
 1st Qu.: 2.7766  
 Median : 5.4110  
 Mean   : 6.4341  
 3rd Qu.:10.1281  
 Max.   :15.3955  

> leo<- read.table("dati_zabotti.csv", header=T,sep=",")
> attach(leo)
> library(spatstat)
> 
> summary(leo)
       x                 y                 t              chlh        
 Min.   :2301708   Min.   :5009151   Min.   :16.30   Min.   : 0.7606  
 1st Qu.:2303334   1st Qu.:5014845   1st Qu.:18.40   1st Qu.: 1.1382  
 Median :2309660   Median :5029621   Median :20.21   Median : 1.3955  
 Mean   :2310653   Mean   :5028168   Mean   :19.65   Mean   : 2.6112  
 3rd Qu.:2316626   3rd Qu.:5039009   3rd Qu.:20.76   3rd Qu.: 2.6832  
 Max.   :2323785   Max.   :5044207   Max.   :21.38   Max.   :13.1886  
      chls        
 Min.   : 0.5698  
 1st Qu.: 2.7766  
 Median : 5.4110  
 Mean   : 6.4341  
 3rd Qu.:10.1281  
 Max.   :15.3955  



leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))

plot(leo_ppp)

density_map <- density(leo_ppp)
> plot(density_map)
> points(leo_ppp)


#saveworkspace
save.image("C:\\lab\\pointpattern")


interpolative data
setwd("C:/lab/")
load("point_pattern_analysis.RData")

#list all files that we have produces
ls()
[1] "density_map" "leo"         "leo_ppp" 

#head function(leo)
head(leo)
        x       y        t       chlh       chls
1 2302884 5027260 20.34755  1.3110573  7.1082322
2 2302119 5031983 20.09945  2.3351714  8.8433274
3 2310209 5026764 20.25418  0.8779825  3.8966652
4 2303490 5023558 20.16274  1.2805183  3.1654455
5 2311296 5026117 20.87947  0.7605694  0.5697923
6 2309111 5040020 20.60006 13.1885874 15.3955188

#recall library
library(spatstat)

#attach dataset function
attach(leo)

#marks function to put data of chlorophyll in water(chlh)
marks(leo_ppp) <- chlh

#smooth function leo ppp based on marks of chlorophyll in water(chlh)..aim to create the (map)
chlh_map <- Smooth(leo_ppp)

cl <- colorRampPalette(c('yellow','orange','red','green'))(100)  
#plot map
plot(chlh_map, col=cl)
points(leo_ppp)

# Exercise: do the same for chlorophyll in the sediment(chls)
marks(leo_ppp) <- chls

#smooth funtion based on the marks to create the desired map in this case for the sediment
chls_map <- Smooth(leo_ppp)

#plot the map
cl <- colorRampPalette(c('yellow','orange','red','green'))(100) 
plot(chls_map, col=cl)
points(leo_ppp)

# multipanel function called par...set parameters and multiframeROWto put several elements together(c),plot diff graps together,1st plot density,second chlh,3rd chls
par(mfrow=c(1,3))

# first graph: density map.....we put the plot in the first column
plot(density_map, col=cl)
points(leo_ppp)

# second graph
plot(chlh_map, col=cl)
points(leo_ppp)

# third graph
plot(chls_map, col=cl)
points(leo_ppp)

# Exercise: build a multipanel with 3 rows and 1 column
# multipanel
par(mfrow=c(3,1))

# first graph: density map
plot(density_map, col=cl)
points(leo_ppp)

# second graph
plot(chlh_map, col=cl)
points(leo_ppp)

# third graph
plot(chls_map, col=cl)
points(leo_ppp)
marks




