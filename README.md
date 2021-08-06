# Minimal working shiny examples

# Shiny notes

* write the analysis in R first and then develop the shiny app
* make a small sketch of how you would like your app to look
* reduce your app to individual work units (i.e. functions/modules) and plug these into app.R instead of having everything in app.R (this improves maintainability)
* From [mastering shiny](https://mastering-shiny.org/scaling-modules.html): "A module is a black box with defined inputs and outputs. Other modules can only communicate via the interface (outside) of a module, they can’t reach inside and directly inspect or modify the internal controls and reactives."
* If you have a module which creates a dataset to pass it on to other modules, always return it at the end of the server function

## TIL

* [multi-input functions](multi_input_function) can be created by stringing inputs together via `tagList()`
* `dput()` function to create code to write your data (e.g. `dput(head(iris))`)
* click left of a code line in RStudio to create a break point in evaluation and interactively look at what is what at the breakpoint
