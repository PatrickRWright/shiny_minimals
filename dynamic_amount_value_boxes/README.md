# Dynamic amount of value boxes

There may be cases where you would like to show varying amounts of `valueBox()`es
dynamically depending on your data. This is achieved by rendering the UI elements
within the server part of the app using `renderUI()`. The UI then only needs to call
`uiOutput()`.

In this specific example we allow selecting entities from `mtcars` via a slider and
create `valueBox()`es dynamically both in amount and in content.
`mpg` < 20 will produce red boxes with thumbs down. All others are green.

References on this:  
https://stackoverflow.com/questions/50608541/shiny-shinydashboard-dynamic-number-of-output-elements-valueboxes  
https://stackoverflow.com/questions/19130455/create-dynamic-number-of-input-elements-with-r-shiny  
https://mastering-shiny.org/action-dynamic.html  
https://rstudio.github.io/shinydashboard/structure.html#valuebox
