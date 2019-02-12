
#activating libraries

#setwd("~/Documents/Bootcamp/ShinyApp Project/Project")
library(shinydashboard)
library(shiny)
library(dplyr)
library(ggplot2)
library(data.table)
library(DT)
library(leaflet)
library(googleVis)
library(corrplot)
library(ggcorrplot)
library(glue)
library(plotly)

#https://catalog.data.gov/dataset?q=international+energy+statistics&sort=views_recent+desc&ext_location=&ext_bbox=&ext_prev_extent=-142.03125%2C2.4601811810210052%2C-59.0625%2C58.63121664342478&page=2
tecdf <- read.csv('tec.csv')


colnames(tecdf) <- substring(colnames(tecdf),2,5)
colnames(tecdf)[1] <- 'Country'
write.csv('tecdf.csv')
#remove row names
rownames(tecdf) = NULL

#create variable with colnames as choice
year = colnames(tecdf)[-1]
nrow(tecdf)
#df for graphs...make copy to transpose
COPY<-data.frame(tecdf)
a = t(COPY)
tmydf = setNames(data.frame(t(tecdf[,-1])), tecdf[,1])
df_t = setDT(tmydf, keep.rownames = TRUE)[]

#rename first column to year
colnames(df_t)[1] <- 'Year'

country_names = colnames(df_t)[-1]

#order column alphabetically
country_names = country_names[order(country_names)]

