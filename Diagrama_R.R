rm(list=ls()) #borrando todo
dir<-"Z:\\Mis Documentos\\0_GRUPO DE ESTABILIDAD FINANCIERA REGIONAL_LUIS_ORTIZ\\NETWORK_ANALYSIS\\MULTILAYER"  #Ubicarnos
setwd(dir)
library(DiagrammeR) 
library(DiagrammeRsvg) 
library(rsvg) 

grViz("digraph{

      graph[rankdir = LR]
  
      node[shape = rectangle, style = filled]
  
      node[fillcolor = green, margin = 0.2]
      A[label = 'Organización \n mercado primario']
      
      node[fillcolor = pink, margin = 0.2]
      B[label = 'Organización \n mercado secundario']
  
      node[fillcolor = Violet, margin = 0.2]
      C[label = 'Mercado de Liquidez \n política monetaria']
      
      node[fillcolor = yellow, margin = 0.2]
      D[label = 'Gestión integral \n del Pasivo Estatal']
      
      node[fillcolor = cyan, margin = 0.2]
      E[label = 'Infraestructura \n Financiera']
      
      node[fillcolor = orange, margin = 0.2]
      F[label = 'Regulación de la \n inversión colectiva']
      
      node[fillcolor = coral, margin = 0.2]
      G[label = 'Convención de \n precios de activos']
      
      node[shape = circle, fillcolor =gray, margin = 0.2]
      META[label = 'Desarrollo del \n mercado interno \n deuda pública']
      
      edge[color = black, arrowhead = vee, arrowsize = 1.25]
      A -> B
      C -> B
      A -> META
      B -> META
      C -> META
      D -> META
      E -> META
      F -> META
      G -> META
      
     }")
