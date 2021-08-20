library(shiny)
library(shinydashboard)
library(shinymanager)
library(scrypt)

# define credentials
credentials <- data.frame(
  user = c("shinyuser", "shinymanager"), # mandatory
  # hashed passwords returned by scrypt::hashPassword()
  # plain, unhashed pws in this case are "user123" and "manager123" 
  # checking what the plain passwords are can be done with scrypt::verifyPassword()
  password =  # mandatory
    c("c2NyeXB0AA8AAAAIAAAAAVcQ/XDtSx6UUp0WQdbUF3jl6MMOyaTzDIiD+WBLlqWiy5Oh/5GmPH7pzNUMhfNhSG7hcbEUvjBAb+qWWFIU2+InkFsKFLDQTLkwnHQf1/xZ",
      "c2NyeXB0ABEAAAAIAAAAAVkEDuuDT1rcwA4uCD1BQ0I+JqL6x3ImLJHNQ2hOMoyTOmUhHGZgmbjZDJNoIY3oI+suqmU2RkB/jPZ69dz7EVrvxY0p5o85wNf/G7hl3CjN"),
  is_hashed_password = TRUE, # mandatory if hased passwords are provided
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
