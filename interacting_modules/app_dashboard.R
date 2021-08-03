library(shiny)
library(shinydashboard)
library(purrr) # for map()

# get functions
map(list.files("interacting_modules/R", full.names = TRUE),
    ~source(.x, encoding = "UTF-8"))

# Define UI
ui <- dashboardPage(
  # header
  dashboardHeader(title = "Module dashboard"),
  # menu
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dataset selection", tabName = "tab_selection", icon = icon("hand-pointer")),
      menuItem("Table head", tabName = "tab_tablehead", icon = icon("table")),
      menuItem("Histogram", tabName = "tab_histcol1", icon = icon("chart-bar"))
    )
  ),
  # tab content
  dashboardBody(
    tabItems(
      # Selection
      tabItem(tabName = "tab_selection", datasetUI("dataset1")),
      # Table head
      tabItem(tabName = "tab_tablehead", showDataTableUI("table1")),
      # Histogram column 1
      tabItem(tabName = "tab_histcol1", histCol1UI("hist1"))
    )
  )
)

# Define server
server <- function(input, output) {
  data <- datasetServer("dataset1")
  showDataTableServer("table1", data)
  histCol1Server("hist1", data)
}

# Run the application 
shinyApp(ui = ui, server = server)
