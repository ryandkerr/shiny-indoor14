library(shiny)
library(BH)
library(ggvis)
indoor <- read.csv("data/indoor14.csv")
indoor$Assists_per_Game <- indoor$Assists / indoor$Games
indoor$Goals_per_Game <- indoor$Goals / indoor$Games
indoor <- replace(indoor, is.na(indoor), 0)

shinyServer(function(input, output) {

  # modify data
  selection <- reactive({
    # min and max assists from slider
    ast_min <- input$ast_range[1]
    ast_max <- input$ast_range[2]
    
    # min and max goals from slider
    goal_min <- input$goal_range[1]
    goal_max <- input$goal_range[2]
    
    # min and max games played from slider
    games_min <- input$game_range[1]
    games_max <- input$game_range[2]
        
    # filtered data
    s <- indoor[indoor$Assists >= ast_min &
                        indoor$Assists <= ast_max &
                        indoor$Goals >= goal_min &
                        indoor$Goals <= goal_max &
                        indoor$Games >= games_min &
                        indoor$Games <= games_max,]
    
    # filter by team
    if(input$team[1] != "All Players") {
      s <- s[s$Team == input$team[1],]
    }
    
    s
  })
        
  player_tooltip <- function(x) {
    #player <- selection[selection$Player == x$Player,]
    #print(player)
    paste0(x$Player)
  }
  
  # creating ggvis scatterplot
  scatter <- reactive({
    # scatterplot of total points/ast
    if(input$radio[1] == "totals") {
      selection %>%
        ggvis(~Assists, ~Goals, key := ~Player, text:= ~Player) %>%
        layer_text(angle := 20) %>%
        add_tooltip(player_tooltip, "hover")
    
    # scatterplot of per game stats
    } else {
      selection %>%
        ggvis(~Assists_per_Game, ~Goals_per_Game, text := ~Player) %>%
        layer_text(angle := 20) %>%
        add_axis("x", title = "Assists/Game") %>%
        add_axis("y", title = "Goals/Game")
    }
  })
      
  scatter %>% bind_shiny("scatter")
    
})