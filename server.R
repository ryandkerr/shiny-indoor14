library(shiny)
library(ggplot2)
indoor <- read.csv("data/indoor14.csv")

shinyServer(function(input, output) {
  output$scatter <- renderPlot({
    # min and max assists from slider
    ast_min <- input$ast_range[1]
    ast_max <- input$ast_range[2]
    
    # min and max goals from slider
    goal_min <- input$goal_range[1]
    goal_max <- input$goal_range[2]
    
    # filtered data
    selection <- indoor[indoor$Assists >= ast_min &
                        indoor$Assists <= ast_max &
                        indoor$Goals >= goal_min &
                        indoor$Goals <= goal_max,]
    
    # creating ggplot scatterplot
    ast_v_goal <- ggplot(data=selection, aes(x=Assists, y=Goals)) + geom_text(label=selection$Player, size=3, angle=-20)
    ast_v_goal
  })
})