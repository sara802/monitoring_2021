#point pattern analysis
#install spatstat,after rgdal
#install.packages("spatstat")

#when calling library no need for " as its there
library(spatstat)

#set the working directory,using disk name:/lab/
setwd("C:/lab/")

# import data
#have the arrow towards the name of dataset <- specified function we want so to read table(source files name with" to say from where we are importing the data
#and header=T to state that there is a column header and this is TRUE)
> covid <- read.table("covid_agg.csv", header=TRUE)

#covid
> covid

#attach function 
> attach(covid)

#planar
> covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

# cases, cat, country, lat, lon

##### if you do not use attach(covid):use the dollar sign
##### covids <- ppp(covid$lon, covid$lat, c(-180,180), c(-90,90))
#####unstead of>attach(covid) and  covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

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

#view the points of the planar
> points(covid_planar)

#rgdal use 
#geospatial data library
#open source software ,rgdal is the r version of this library#to make use of polygon data for expl

#first install the package 
install.packages("rgdal")
