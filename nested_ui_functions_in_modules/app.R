library(shiny)
library(purrr) # for map()

# get functions
map(list.files("nested_ui_functions_in_modules/R", full.names = TRUE),
    ~source(.x, encoding = "UTF-8"))

# Define UI for application that draws a histogram
ui <- fluidPage(

  xyPlotUI("plot_mod")
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  xyPlotServer("plot_mod")
  
}

# Run the application 
shinyApp(ui = ui, server = server)
