library(shiny)
library(purrr) # for map()

# get functions
map(list.files("R", full.names = TRUE),
    ~source(.x, encoding = "UTF-8"))

# Define UI for application that draws a histogram
ui <- fluidPage(
    # run function
    two_sliders_and_one_button()
)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
