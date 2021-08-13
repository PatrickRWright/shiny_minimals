library(shiny)
library(shinydashboard)
library(shinymanager)

# define credentials
credentials <- data.frame(
  user = c("shinyuser", "shinymanager"), # mandatory
  password = c("user123", "manager123"), # mandatory
  start = c("2019-04-15"), # optional (all others)
  expire = c(NA, "2025-12-31"),
  admin = c(FALSE, TRUE),
  comment = c("regular user account", "admin account"),
  stringsAsFactors = FALSE
)


ui <- dashboardPage(
  dashboardHeader(title = "A dashboard"),
  # Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Selection", tabName = "selection", icon = icon("hand-pointer")),
      menuItem("News", tabName = "news", icon = icon("newspaper")),
      menuItem("Wikipedia", tabName = "votum", icon = icon("wikipedia-w")),
      menuItem("Download", tabName = "news", icon = icon("download")),
      menuItem("Help", tabName = "news", icon = icon("question-circle"))
    )
  ),
  dashboardBody()
)

# Wrap your UI with secure_app
ui <- shinymanager::secure_app(ui)

server <- function(input, output, session) {

  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- shinymanager::secure_server(
    check_credentials = shinymanager::check_credentials(credentials)
  )
  
  # your classic server logic follows below
  
}

shinyApp(ui, server)
