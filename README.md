# Shiny notes

* write the analysis in R first and then develop the shiny app
* make a small sketch of how you would like your app to look
* reduce your app to individual work units (i.e. functions) and plug these into app.R instead of having everythin in app.R (this improves maintainability)

## TIL

* [multi-input functions](multi_input_function) can be created by stringing inputs together via `list()`
* `dput()` function to create code to write your data (e.g. `dput(head(iris))`)
* click left of a code line in RStudio to create a break point in evaluation and interactively look at what is what at the breakpoint
