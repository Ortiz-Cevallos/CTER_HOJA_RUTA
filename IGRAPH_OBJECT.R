rm(list=ls()) #borrando todo
dir<-"Z:\\Mis Documentos\\0_GRUPO DE ESTABILIDAD FINANCIERA REGIONAL_LUIS_ORTIZ\\NETWORK_ANALYSIS\\MULTILAYER"  #Ubicarnos
setwd(dir)
library("tidyr")
library("plyr")
library("dplyr")
library("xts")
library("zoo")
library("splitstackshape")
#alternativa de cargar la data como si fuera un objeto xts
BASE          <- read.csv("BASE.csv", sep = ";", header=TRUE)
library(igraph)
library(ggplot2)
library(ggnetwork)
library(geomnet)
library(graphlayouts) 
library(ggraph)
g  <- graph_from_data_frame(BASE, directed = FALSE)
V(g)$lvl    <- c(1,1,2,2,2,2,2,2,2,2,2,3,3,3)
#V(g)$label1 <- c("Estándares","Regulación","BCR","BCRES","BG","BCH",
 #                "BCN","BCRD","LBTR","BNP","Bancos Comerciales","BOLCEN",
  #               "Trade Repositary","CDV")
V(g)$label1 <- c("A","B","D","E","F","G",
                "H","I","J","K","L","AA",
                "BB","CC")
xy <- layout_as_multilevel(g,type = "all", alpha = 25, beta = 45)
ggraph(g, "manual", x = xy[, 1], y = xy[, 2]) +
  geom_edge_link0(
    aes(filter = (node1.lvl == 1 & node2.lvl == 1)),
    edge_colour = "orange",
    alpha = 1,
    edge_width = 0.1
  ) +
  geom_edge_link0(
    aes(filter = (node1.lvl == 1 & node2.lvl==2 & node1.lvl != node2.lvl)),
    alpha = 1,
    edge_width = 0.1,
    edge_colour = "black"
  ) +
  geom_edge_link0(
    aes(filter = (node1.lvl == 2 &
                    node2.lvl == 2)),
    edge_colour = "orange",
    edge_width = 0.1,
    alpha = 1
  ) +
  geom_edge_link0(
    aes(filter = (node1.lvl == 3 & node2.lvl == 3)),
    edge_colour = "orange",
    alpha = 1,
    edge_width = 0.1
  ) +
  geom_edge_link0(
    aes(filter = (node1.lvl == 2 & node2.lvl==3  & node1.lvl != node2.lvl)),
    alpha = 1,
    edge_width = 0.1,
    edge_colour = "black"
  ) +
  geom_node_point(aes(shape = as.factor(lvl), size = as.factor(lvl), 
                      fill = as.factor(lvl))) +
  scale_shape_manual(values = c(21, 22, 23)) +
  scale_size_manual( values = c(15, 12, 9) ) +
  scale_fill_manual(values=c('red','blue', "green"))+
  geom_node_text(aes(label=label1))+
  theme_graph() +
  coord_cartesian(clip = "off", expand = TRUE) +
  theme(legend.position = "none")