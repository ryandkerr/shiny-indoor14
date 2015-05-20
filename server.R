library(shiny)
library(ggplot2)

indoor <- read.csv("data/indoor14.csv")

ast_min <- 5
ast_max <- 50

selection <- indoor[indoor$Assists > ast_min & indoor$Assists < ast_max,]

ast_v_goal <- ggplot(data=selection, aes(x=Assists, y=Goals)) + geom_text(label=selection$Player, size=3, angle=-15)
ast_v_goal


shinyServer(function(input, output) {
  
})