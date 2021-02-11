#R spatial
install.packages("sp")
library(sp)
#call library no quotes

data(meuse)
#remember to recall datasets!use data

head(meuse)
#the main coordinates(meuse)
#tidal for grouping different things

#after viewing meuse we put the cordinates
coordinates(meuse) = ~x+y

#then plot it
plot(meuse)

# spplot is used to plot elements like zinc, lead etc. spread in space
spplot(meuse, "zinc", main="Concentration of zinc")
#main to indicate name or title,always double quotes

#plot the concentration of Copper
spplot(meuse, "copper", main="Concentration of copper")

#copper and zinc
spplot(meuse, c("copper","zinc"))
#we want to see both so input c

# this is the same solution we used for te first lecture_c for 
# primates <- c(1,5,10)

# Before using colors, let's make bubbles!
bubble(meuse, "zinc")

# do the same for lead
bubble(meuse, "lead")
bubble(meuse, "lead", col="red")

