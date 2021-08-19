# Nested ui functions in modules

If a module's UI contains nested functions (i.e. one function provides the basic
building blocks and the other function chains calls to the first function together
via `tagList()`) the `NS()` call needs to be correctly placed which can be a
little tricky. This example shows how this can be achieved.