library(shiny)
library(BH)
library(ggvis)

shinyUI(fluidPage(
  titlePanel("11th Anual Jack Marsh Memorial Indoor League"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Data from the 2014 Harvard indoor ultimate frisbee league."),
      
      radioButtons("radio", label = "Data Format",
                   choices = list("Totals" = "totals", "Per Game" = "per"),
                   selected = "totals"),
      
      sliderInput("ast_range", "Assists:",
                  min = 0, max = 40, value = c(0, 40)),
      
      sliderInput("goal_range", "Goals:",
                  min = 0, max = 40, value = c(0, 40)),
      
      sliderInput("game_range", "Games Played:",
                  min = 0, max = 8, value = c(0, 8)),
      
      selectInput("team", label = "Team:",
                  choices = list("All Players", "Josh Fries Memorial", "No Flex Zone", "Swai Guys",
                                 "Rooftop Swai Farm", "Brawl or Nothing", "The Buns", "Lev Towers", "MotherHuckers"),
                  selected = "All Players")
    ),
    
    mainPanel(
      ggvisOutput("scatter")
    )
    
  )
))