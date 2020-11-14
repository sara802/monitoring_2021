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
