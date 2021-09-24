library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = img(src = "logo2.png", height = 41, width = 116)),
  # Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("A Dog", tabName = "img1", icon = icon("dog")),
      menuItem("A Cat", tabName = "img2", icon = icon("cat")),
      menuItem("A Horse", tabName = "img3", icon = icon("horse"))
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "img1",
              h2("The first image"),
              img(src = "dog.png", height = 500, width = 500)
      ),
      
      # Second tab content
      tabItem(tabName = "img2",
              h2("The second image"),
              img(src = "cat.jpg", height = 500, width = 500)
      ),
      
      # Third tab content
      tabItem(tabName = "img3",
              h2("The third image"),
              img(src = "horse.gif")
      )
    )
  )
)

server <- function(input, output, session) {


}

shinyApp(ui, server)
