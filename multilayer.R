rm(list=ls()) #borrando todo
library(igraph)
library(graphlayouts) 
library(ggraph)
library(threejs)
data("multilvl_ex", package = "graphlayouts")
xy <- layout_as_multilevel(multilvl_ex,type = "all", alpha = 25, beta = 45)
ggraph(multilvl_ex, "manual", x = xy[, 1], y = xy[, 2]) +
  geom_edge_link0(
    aes(filter = (node1.lvl == 1 & node2.lvl == 1)),
    edge_colour = "blue",
    alpha = 1,
    edge_width = 0.1
  ) +
  geom_edge_link0(
    aes(filter = (node1.lvl != node2.lvl)),
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
  geom_node_point(aes(shape = as.factor(lvl)), fill = "grey25", size = 3) +
  scale_shape_manual(values = c(21, 22)) +
  theme_graph() +
  coord_cartesian(clip = "off", expand = TRUE) +
  theme(legend.position = "none")