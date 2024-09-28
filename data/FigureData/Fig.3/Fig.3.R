#R_code for Figure 3

#Fig.3B
library(psych)
library(corrplot)
library(dplyr)
library(ggplot2)
setwd("D:/pengqiannan/Modeling-bacterial-interactions/Fig.3")
data<-read.table("Flux.txt",header=TRUE,sep="\t",row.names=1,quote = "")
data <- data %>% mutate(across(where(is.numeric), ~ .x / 1000))
data= as.matrix(data)
redgreen <- c("#CD3700", "#008B45")
corrplot(data,add=F, type="full", method="circle", tl.pos="lt", col = redgreen, cl.pos = "n", tl.col = "black")
