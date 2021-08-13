# in part reproduced from:
# https://rstudio.github.io/DT/010-style.html
# https://gist.github.com/cecilialee/e848068cfd5862fd63961b03b42ead78
# https://gist.github.com/cecilialee/8df9afe984f6040d7e427d5da4a5bbf2

library(shiny)
library(DT)
library(dplyr)

# prep icons for table
# find icons here: https://fontawesome.com/v5.15/icons?d=gallery&p=2&m=free
gicon <- function(x) {
  as.character(icon(x, lib = "font-awesome"))
}


ui <- basicPage(
  # show table in ui
  DT::dataTableOutput("table"),
  # adjust color of icons
  tags$style(".fa-fan {color:#196130}
              .fa-bahai {color:#32c260}
              .fa-sun {color:#ccd12c}"),
  # this is a hidden indicator that font-awesome is needed
  tags$span(icon("tag"), style = "display: none;")
)

server <- function(input, output, session) {
  
  set.seed(1337)
  iris_sample <- iris[sample(150, 15), ]
  
  # prepare icon column
  iris_icons <- iris_sample %>% mutate(species_icon = case_when(Species == "setosa" ~ gicon("fan"),
                                                                Species == "versicolor" ~ gicon("bahai"),
                                                                Species == "virginica" ~ gicon("sun")))
  
  output$table <- DT::renderDataTable({
                          # escape needed to render the icons
    datatable(iris_icons, escape = FALSE) %>%
      # numeric values as histogram in table
      formatStyle(c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
                  background = styleColorBar(c(0, 10), color = "#beccbf"),
                  backgroundSize = '98% 78%',
                  backgroundRepeat = 'no-repeat',
                  backgroundPosition = 'center')
  })
}

shinyApp(ui, server)
