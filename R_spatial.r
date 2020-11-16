#R spatial
install.packages("sp")
library(sp)

data(meuse)

head(meuse)

#the main coordinates(meuse)
#tidal for grouping different things
coordinates(meuse) = ~x+y

plot(meuse)

# spplot is used to plot elements like zinc, lead etc. spread in space
spplot(meuse, "zinc", main="Concentration of zinc")

#plot the concentration of Copper
spplot(meuse, "copper", main="Concentration of copper")

#copper and zinc
spplot(meuse, c("copper","zinc"))

# this is the same solution we used for te first lecture_c for 
# primates <- c(1,5,10)

# Before using colors, let's make bubbles!
bubble(meuse, "zinc")

# do the same for lead
bubble(meuse, "lead")
bubble(meuse, "lead", col="red")

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
#setwd("C:/lab/")

covid <- read.table("covid_agg.csv" , header= TRUE)



import data

