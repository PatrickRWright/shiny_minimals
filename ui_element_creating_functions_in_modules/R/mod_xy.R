xyPlotUI <- function(id) {
  tagList(
    
    # need to pass the id to xy_sliders_o !!!
    xy_sliders_o(id),
    # need to pass the id to xy_sliders_x !!!
    xy_sliders_x(id),
    
    # plot output
    plotOutput(NS(id, "plot"))
  )
}

xyPlotServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$plot <- renderPlot(list(
      plot(input$slxo, input$slyo,
           xlim = c(0, 10), ylim = c(0, 10),
           main = "Move the o and the x with the sliders..."),
      points(input$slxx, input$slyx, pch = 4, col = 2)
    )
    )
    
  })
}
