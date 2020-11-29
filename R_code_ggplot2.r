#ggplot2 package was downloaded
> library(ggplot2)
> biofuels <- c (120,200,350,570,750)
> biofuels
[1] 120 200 350 570 750
> oxidative <- c (1200,1300,21000,34000,50000)
> oxidative
[1]  1200  1300 21000 34000 50000
> d<- data.frame(biofuels,oxidative)
> ggplot(d,aes(x=biofuels,y=oxidative))+geom_point()
> ggplot(d,aes(x=biofuels,y=oxidative))+geom_point(size=5, col= "red")
> ggplot(d,aes(x=biofuels,y=oxidative))+geom_line()
> ggplot(d,aes(x=biofuels,y=oxidative))+geom_point(size=5, col= "red")+geom_line()
> ggplot(d,aes(x=biofuels,y=oxidative))+geom_polygon()
> save.image("C:\\lab\\.RData")

#import data
#> setwd("C:/lab/")

> covid <- read.table("covid_agg.csv", header=TRUE)
> covid

#we can see the dataset associated to the file(all of the countries and their numeric data values and points)
#lets see the first 6 lines(countries...)

 head(covid)
  cat             country cases       lat        lon
1   1         Afghanistan    21  33.83890  66.026530
2   2             Albania    51  41.14596  20.069178
3   3             Algeria    49  28.16336   2.632366
4   4             Andorra    14  42.54858   1.575688
5   5 Antigua and Barbuda     1  17.28014 -61.791128
6   6           Argentina    56 -35.37667 -65.167485


#we can make a function
#summary(covid)
      cat           country              cases              lat         
 Min.   :  1.00   Length:152         Min.   :    1.0   Min.   :-41.837  
 1st Qu.: 38.75   Class :character   1st Qu.:    4.0   1st Qu.:  7.878  
 Median : 76.50   Mode  :character   Median :   24.5   Median : 25.668  
 Mean   : 76.50                      Mean   : 1135.7   Mean   : 24.027  
 3rd Qu.:114.25                      3rd Qu.:  133.2   3rd Qu.: 43.965  
 Max.   :152.00                      Max.   :81116.0   Max.   : 64.998  
      lon         
 Min.   :-149.57  
 1st Qu.: -10.48  
 Median :  15.28  
 Mean   :  11.55  
 3rd Qu.:  43.97  
 Max.   : 171.60  

#lets use ggplot2:)
#first we have to explain that we want to use the library of ggplot2
# ggplot2
> 
> library(ggplot2)
> 
> ggplot(covid, aes(x = lon, y = lat)) + geom_point()
#estetics(coordinates and addional,x in general longitude,y will be latitude
#there is a function names,gives you the names of the variables(of the given dataset)
#with geom_point we can see the points
#we can change the size of the points in estetics,so for expl, name of variable and column is cases 

ggplot(covid, aes(x = lon, y = lat, size = cases)) + geom_point()
#we can see the graph now with bigger size points(of the cases)
