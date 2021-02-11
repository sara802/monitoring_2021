

#this is an array
primates<-c(3,5,9,15,40)
primates

#new set
crabs <- c(100,70,30,10,5)
crabs

#first plot in R

plot(primates,crabs)

#plot with color...col=DOUBLE QUOTES
plot(primates,crabs,col="red")

#fill in circles by adding pch to list in brackets
plot(primates,crabs,col="red",pch=19)

#change size of symbol(circle)with cex
plot(primates,crabs,col="red",pch=19, cex=2)
plot(primates,crabs,col="red",pch=19, cex=6)

#main added as to make a title name,main=DOUBLE QUOTES
plot(primates,crabs,col="red",pch=19, cex=6,main="my first ecological graph in R!")
 
#CREATE A DATAFRAME....use function data.frame assign to ecoset
ecoset <- data.frame(primates,crabs)

ecoset

#find mean value per site
(3+5+9+15+40)/5
(100+70+30+10+5)/5

#summary of the dataframe...we can see min,1st 2nd 3rd quantile,max,median and mean....
summary(ecoset)

