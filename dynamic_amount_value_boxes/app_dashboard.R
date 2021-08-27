library(shiny)
library(shinydashboard)

# Define UI
ui <- dashboardPage(
  # header
  dashboardHeader(title = "Dynamic valueBoxes"),
  # menu
  dashboardSidebar(
    sidebarMenu(
      menuItem("Pick", tabName = "tab_selection", icon = icon("hand-pointer"))
    )
  ),
  # tab content
  dashboardBody(
    tabItems(
      # Selection
      tabItem(tabName = "tab_selection",
              
              sliderInput("slider", "Number of boxes/cars:", min = 1, max = nrow(mtcars),
                          value = 5, step = 1),
              uiOutput("allValueBoxes")
              )
    )
  )
)

# Define server
server <- function(input, output) {

  output$allValueBoxes <- renderUI({
    numBoxes <- as.integer(input$slider)
    # this creates a list of html chunks
    # each list element is one html chunk for one valueBox
    lapply(1:numBoxes, function(i, data = mtcars) {
      curr_val <- data[i, ]
      if(curr_val$mpg > 20) {
        icon <- "thumbs-up"
        col <- "green"
      } else {
        icon <- "thumbs-down"
        col <- "red"
      }
      valueBox(
        row.names(curr_val), curr_val$mpg, icon = icon(icon, lib = "glyphicon"),
        color = col
      )
    })
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
