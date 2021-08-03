# show hist of first column
histCol1UI <- function(id) {
  plotOutput(NS(id, "histcol1"))
}

# render hist of first column
histCol1Server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$histcol1 <- renderPlot(hist(data()[, 1]))
  })
}