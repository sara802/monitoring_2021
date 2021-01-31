

#this is an array
primates<-c(3,5,9,15,40)
primates

#new set
crabs <- c(100,70,30,10,5)
crabs

#first plot in R
plot(primates,crabs,col="red")

plot(primates,crabs,col="red",pch=19)

plot(primates,crabs,col="red",pch=19, cex=2)
plot(primates,crabs,col="red",pch=19, cex=6)

plot(primates,crabs,col="red",pch=19, cex=6,main="my first ecological graph in R!")
#main added as to make a title name 

#create 
ecoset <- data.frame(primates,crabs)
ecoset
#(3+5+9+15+40)/5
#summary of the dataframe
summary(ecoset)

