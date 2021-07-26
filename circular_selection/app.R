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

server <- function(input, output) {
  
  # react to the group selection
  selected <- reactive(source_data[[input$group]])
  
  # init the index
  vals <- reactiveValues(index = 1)
  
  # check if index incremented ("Up" button clicked)
  observeEvent(input$countUP, {
    vals$index <- vals$index + 1
    if (vals$index > length(selected())) {
      vals$index <- 1
    }
  })
  
  # check if index decremented ("Down" button clicked)
  observeEvent(input$countDOWN, {
    vals$index <- vals$index - 1
    if (vals$index < 1) {
      vals$index <- length(selected())
    }
  })
  
  # check if group was changed and reset index if it was
  observeEvent(input$group, vals$index <- 1)
  
  # show value in current group at current index
  output$item <- renderText(selected()[vals$index])
  
  # show full vector to allow inspection of circularity
  output$full <- renderText(paste0(selected(), collapse = ", "))
}

shinyApp(ui = ui, server = server)