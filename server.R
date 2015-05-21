library(shiny)
library(ggplot2)
indoor <- read.csv("data/indoor14.csv")
indoor$Assists_per_Game <- indoor$Assists / indoor$Games
indoor$Goals_per_Game <- indoor$Goals / indoor$Games
indoor <- replace(indoor, is.na(indoor), 0)

shinyServer(function(input, output) {
  
  output$scatter <- renderPlot({
    # min and max assists from slider
    ast_min <- input$ast_range[1]
    ast_max <- input$ast_range[2]
    
    # min and max goals from slider
    goal_min <- input$goal_range[1]
    goal_max <- input$goal_range[2]
    
    # min and max games played from slider
    games_min <- input$game_range[1]
    games_max <- input$game_range[2]
    
    print(input$team[1])
    
    # filtered data
    selection <- indoor[indoor$Assists >= ast_min &
                        indoor$Assists <= ast_max &
                        indoor$Goals >= goal_min &
                        indoor$Goals <= goal_max &
                        indoor$Games >= games_min &
                        indoor$Games <= games_max,]
    
    if(input$team[1] != "All Players") {
      selection <- selection[selection$Team == input$team[1],]
    }
        
    # creating ggplot scatterplot
    if(input$radio[1] == "totals") {
      ast_v_goal <- ggplot(data=selection, aes(x=Assists, y=Goals)) + 
        geom_text(label=selection$Player, size=3, angle=-20)
      ast_v_goal
    } else {
      ast_v_goal <- ggplot(data=selection, aes(x=Assists_per_Game, y=Goals_per_Game)) + 
        geom_text(label=selection$Player, size=3, angle=-20)
      ast_v_goal
    }
  })
})