library(shiny)

shinyUI(fluidPage(
  titlePanel("11th Anual Jack Marsh Memorial Indoor League"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Data from the 2014 Harvard indoor ultimate frisbee league."),
      
      sliderInput("ast_range", "Assists:",
                  min = 0, max = 40, value = c(0, 40)),
      
      sliderInput("goal_range", "Goals:",
                  min = 0, max = 40, value = c(0, 40)),
      
      sliderInput("game_range", "Games Played:",
                  min = 0, max = 8, value = c(0, 8))
    ),
    
    mainPanel(
      plotOutput("scatter")
    )
    
  )
))