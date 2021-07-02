#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# init some character vectors
starwars_chars <- starwars$name
car_models <- row.names(mtcars)

# merge them into a list to allow downstream selection
source_data <- list(starwars_chars, car_models)
source_data <- setNames(source_data, c("StarWars", "MTcars"))

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("A circular selector"),
    
  
    selectInput("group", "Group", choices = c("StarWars", "MTcars")),
    
    fluidRow(
        column(1, actionButton("countUP", "Up", width = "90%")),
        column(1, actionButton("countDOWN", "Down", width = "90%")),
        column(4, span(textOutput("item"), style="color:red"))
    ),
    # show full vector to allow inspection of circularity
    textOutput("full")
)

