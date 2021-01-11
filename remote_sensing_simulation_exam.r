install.packages("ncdf4")
setwd("C:/lab/")
library(raster)
library(ncdf4)

tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

cltjan <- colorRampPalette(c('blue','yellow','red'))(100) #
plot(tjan, col=cltjan)

toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(toct, col=cltjan)

dift <- tjan - toct
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(dift, col=cldif)

