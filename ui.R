library(shiny)

shinyUI(fluidPage(
  titlePanel("Indoor 2014 Data"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("ast_range", "Assists:",
                  min = 0, max = 40, value = c(0, 40)),
      
      sliderInput("goal_range", "Goals:",
                  min = 0, max = 40, value = c(0, 40))
    ),
    
    mainPanel(
      plotOutput("scatter")
    )
    
  )
))