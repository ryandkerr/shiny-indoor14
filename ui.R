library(shiny)

shinyUI(fluidPage(
  titlePanel("Indoor 2014 Data"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("ast_range", h4("Assists:", align = "center"),
                  min = 0, max = 40, value = c(0, 40)),
      
      sliderInput("goal_range", "Goals:",
                  min = 0, max = 40, value = c(0, 40))
    ),
    
    mainPanel(
      plotOutput("scatter")
    )
    
  )
))