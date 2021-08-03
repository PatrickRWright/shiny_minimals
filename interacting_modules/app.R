library(shiny)
library(purrr) # for map()

# get functions
map(list.files("interacting_modules/R", full.names = TRUE),
    ~source(.x, encoding = "UTF-8"))

# Define UI
ui <- fluidPage(
  datasetUI("dataset1"),
  showDataTableUI("table1"),
  histCol1UI("hist1")
)

# Define server
server <- function(input, output) {
  data <- datasetServer("dataset1")
  showDataTableServer("table1", data)
  histCol1Server("hist1", data)
}

# Run the application 
shinyApp(ui = ui, server = server)
