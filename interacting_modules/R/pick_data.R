# pick dataset
datasetUI <- function(id) {
  selectInput(NS(id, "dataset"), "Dataset", choices = c("mtcars", "iris", "USArrests"))
}

# process selection
datasetServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    data <- reactive({
      if(input$dataset == "mtcars") {
        mtcars
      }
      else if(input$dataset == "iris") {
        iris
      }
      else if(input$dataset == "USArrests") {
        USArrests
      }
    })
  })
}