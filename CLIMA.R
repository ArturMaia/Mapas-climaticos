library(rnaturalearth)
library(ggplot2)
library(maptools)
library(raster)
library(rgdal)
library(rgeos)
library(RColorBrewer)
library(dplyr)
library(geodata)

#MUDIAL
clim<-getData('worldclim', var='bio', res=10)
clima<-clim$bio1/10
cores <- brewer.pal(11, "RdYlBu")
cores <- colorRampPalette(cores)(50)
cores <- rev(cores)

plot(clima,col=cores,
     legend.width= 1.5,  axis.args=list(cex.axis=0.6),
     legend.args=list(text="Temperatura (ºC)",
                      side=3, line=0.5, cex=0.8))

#CONTINENTES
cont<-ne_countries(continent  = 'south america' , returnclass = 'sf')
sam<-crop(clima,cont)

cores <- brewer.pal(11, "RdYlBu")
cores <- colorRampPalette(cores)(50)
cores <- rev(cores)

plot(sam,col=cores,
     legend.width= 1.5,  axis.args=list(cex.axis=0.6),
     legend.args=list(text="Temperatura (ºC)",
                      side=3, line=0.5, cex=0.8))

#PAÍS
mada<-ne_states(country = "Madagascar", returnclass = 'sf')
clim<- getData('worldclim', var='bio', res=10)/10
clima<-clim$bio1/10
climmada<-crop(clima,mada)

plot(mada)
cores <- brewer.pal(11, "RdYlBu")
cores <- colorRampPalette(cores)(50)
cores <- rev(cores)

plot(climmada,col=cores,
     legend.width= 1.5,  axis.args=list(cex.axis=0.6),
     legend.args=list(text="Altitude (mt)",
                      side=3, line=0.5, cex=0.8))+title("clima madagascar")
