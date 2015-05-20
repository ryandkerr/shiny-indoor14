library(shiny)
library(ggplot2)

indoor <- read.csv("data/indoor14.csv")

ast_v_goal <- ggplot(data=indoor, aes(x=Assists, y=Goals)) + geom_text(label=indoor$Player, size=3, angle=-15)
ast_v_goal

shinyServer(function(input, output) {
  
})