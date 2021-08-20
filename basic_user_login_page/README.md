# Basic user login page

Example how the wrap a `shinydashboard` into a `shinymanager` login page.
Credentials are hashed using the `scrypt` library. Timout before login is
implemented in this example. Without it, the session will not end while
the user idles on the login page which can use up a lot of resources.

StackOverflow [reference](https://stackoverflow.com/questions/28987622/starting-shiny-app-after-password-input)