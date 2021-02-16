###chemical cycles
###pollution
##change of nitrogen dioxide through certain time period

#call library
 library(raster)

###set wd
setwd("C:/lab/") 


####import images with raster function,assign names to each
EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

# Alternatively make a sort of list,that will put all files in one list
#
#####
rlist <- list.files(pattern="EN")

rlist 
#take the rlist and raster and do an lapply to create the list raster..
list_rast <- lapply(rlist, raster)
###make a stack of this new created hybrid of raster rlist and put assign a name to this new stack
 ENstack <- stack(list_rast)


###use of colors,always put c to bind different colors in the palette
cl <- colorRampPalette(c('red','orange','yellow'))(100) # 

##par to make a row column of 2 files
par(mfrow=c(1,2))
plot(EN01, col=cl)
plot(EN13, col=cl)

# dev.off()

###we want to show the change difference in nitrogen dioxide 
difno2 <- EN01 - EN13

###subtract last file from first and assign it a name like for the change... difference

##make use of colors for this difference and plot the diff with color
cldif <- colorRampPalette(c('blue','black','yellow'))(100) # 
plot(difno2, col=cldif)


###plot each file with color
plot(EN01, col=cl)
 plot(EN02, col=cl)
 plot(EN03, col=cl)
 plot(EN04, col=cl)
 plot(EN05, col=cl)
 plot(EN06, col=cl)
 plot(EN07, col=cl)
 plot(EN08, col=cl)
 plot(EN09, col=cl)
 plot(EN10, col=cl)
 plot(EN11, col=cl)
 plot(EN12, col=cl)
 plot(EN13, col=cl)

###make the par function

par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

#### make a stack,assign to new name,and plot it with color function
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
plot(EN, col=cl)


 dev.off()

####plot rgb assigning to each color a file
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")


##### boxplot
boxplot(EN,horizontal=T,axes=T,outline=F, col="red",xlab="NO2 - 8bit", ylab="Period")
####we have lab that stands for label here 
###assigning to x and y the nitrogen to time period respectively 













