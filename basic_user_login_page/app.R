library(shiny)
library(shinydashboard)
library(shinymanager)
library(scrypt)
library(purrr) # for map()

# get externalised components
map(list.files("basic_user_login_page/R", full.names = TRUE),
    ~source(.x, encoding = "UTF-8"))

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

# Wrap your UI with secure_app - head_auth enables the timeout on the login page
# the source for the inactivity variable is located in the R directory
ui <- shinymanager::secure_app(head_auth = tags$script(inactivity), ui)

server <- function(input, output, session) {

  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- shinymanager::secure_server(
    # the source for the credentials variable is located in the R directory
    check_credentials = shinymanager::check_credentials(credentials)
  )
  
  # your classic server logic follows below
  
}

shinyApp(ui, server)
