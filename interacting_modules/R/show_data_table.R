# show table head
showDataTableUI <- function(id) {
  tableOutput(NS(id, "table"))
}

# render table head
showDataTableServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$table <- renderTable(head(data()))
  })
}