#Lets plot the relationship among ecological variables


#install.packages is installed 
install.packages("sp")

library(sp)
#no use of "because sp in already now in R
data(meuse)
#look inside the chat!
meuse



#how to view
view(meuse)

head(meuse)

#mean of all of the variables
#cadmium crazy mean extraction
#(11,7+8,6+6,5,...)/N
summary(meuse)

#exercise plot zinc (y) against cadmium (x)
#$
plot(meuse$cadmium, meuse$zinc)
 #use attach function unstead of dollar

attach(meuse)
 plot(cadmium, zinc)
plot(cadmium, lead)

#trivial or
#you can use scatterplot matrices
pairs(meuse)





#second part
#recall sp package ,dataset meuse
library(sp)
data(meuse)

pairs(meuse)

head(meuse)

#4 variable
#pairs with soil variables

#x,y,cooper,lead,zinc
#from 3rd to sixth column
pairs(meuse[,3:6])

# let's use the names of the columns:
pairs(~ cadmium + copper + lead + zinc, data=meuse) 
# tilde is going to be done by AltGr + ^

# let's prettify the graph
# Exercise: just use cadmium, lead and zinc
pairs(~ cadmium + lead + zinc, data=meuse)

# Exercise: change the color
#col="" COLOR
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red") 

# for the future change colors of single panels by the par() function
#par()COLOR CHANGE

# Exercise: change the symbol to filled triangles: pch
#pch= FILL TRIANGLE

pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17) 


# Exercise: increase the size of the triangles
#cex= SIZE TRIANGLE
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=3)




 
