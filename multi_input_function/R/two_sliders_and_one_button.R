two_sliders_and_one_button <- function() {
  tagList(sliderInput("sl1", label = "slider 1", min = 0, max = 10, value = 2),
          sliderInput("sl2", label = "slider 2", min = 0, max = 100, value = 22),
          actionButton("btn", label = "button"))
}