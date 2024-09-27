#R_code for Figure 4

#Fig.4C
library(psych)
library(corrplot)
library(magrittr)
library(dplyr)
setwd("D:/pengqiannan/Modeling-bacterial-interactions/Fig.4")
data<-read.table("metabolites.txt",header=TRUE,sep="\t",row.names=1,quote = "")
data <- data %>% mutate(across(where(is.numeric), ~ .x / 15))
data= as.matrix(data)
col <- colorRampPalette(c("#008B45", "white","#CD3700" )) 
corrplot(data,add=F, type="full", method="square", tl.pos="lt", col = col(20), cl.pos = "n", tl.col = "black")

#Fig.4D
library(psych)
library(corrplot)
library(magrittr)
library(dplyr)
setwd("D:/pengqiannan/Modeling-bacterial-interactions/Fig.4")
data<-read.table("cellgrowth.txt",header=TRUE,sep="\t",row.names=1,quote = "")
data <- data %>% mutate(across(where(is.numeric), ~ .x / 400000000))
data= as.matrix(data)
col <- colorRampPalette(c("#008B45","white","#CD3700" )) 
corrplot(data,add=F, type="full", method="square", tl.pos="lt", col = col(20), cl.pos = "n", tl.col = "black")