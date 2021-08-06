# function constructor needs the parent id to properly call NS !!!
slider_func <- function(id_parent, id, label) {
  sliderInput(NS(id_parent, id),
              label, min = 0, max = 10, value = 2, step = 0.1)
}

# sliders for the o-point in the diagram
xy_sliders_o <- function(id_parent) {
  tagList(slider_func(id_parent, id = "slxo", label = "Select X o"),
          slider_func(id_parent, id = "slyo", label = "Select Y o")
  )
}

# sliders for the x-point in the diagram
xy_sliders_x <- function(id_parent) {
  tagList(slider_func(id_parent, id = "slxx", label = "Select X x"),
          slider_func(id_parent, id = "slyx", label = "Select Y x")
  )
}
