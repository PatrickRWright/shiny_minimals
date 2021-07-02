server <- function(input, output) {
    
    # react to the group selection
    selected <- reactive(source_data[[input$group]])
    
    # init the index
    vals <- reactiveValues(index = 1)
    
    # check if index incremented ("Up" button clicked)
    observeEvent(input$countUP, {
        vals$index <- vals$index + 1
        if (vals$index > length(selected())) {
            vals$index <- 1
        }
    })
    
    # check if index decremented ("Down" button clicked)
    observeEvent(input$countDOWN, {
        vals$index <- vals$index - 1
        if (vals$index < 1) {
            vals$index <- length(selected())
        }
    })
    
    # check if group was changed and reset index if it was
    observeEvent(input$group, vals$index <- 1)
    
    # show value in current group at current index
    output$item <- renderText(selected()[vals$index])
    
    # show full vector to allow inspection of circularity
    output$full <- renderText(paste0(selected(), collapse = ", "))
}
