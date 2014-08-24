shinyUI(fluidPage(
  titlePanel("Developing Data Products - Project"),
  sidebarPanel(
    selectInput("class", "Class", c("1st", "2nd", "3rd", "Crew")),
    radioButtons("sex", "Sex", c("Male", "Female")),
    radioButtons("age", "Age", c("Child", "Adult")) 
  ),
  mainPanel(
    h1("Titanic Survivor Statistics"),
    p("This application calculates survivor statistics based upon the Titanic
      dataset. The dataset is broken apart by Class, Sex, Age, and the number
      of those who survived the sinking of the ship Titanic in 1912 in those 
      groups. The user can explore by selecting different combinations of 
      these variables. There are statistics on a total of 711 survivors 
      and 1490 who did not survive the event."),
    p("User Input Selections:"),
    textOutput("class"),
    textOutput("sex"),
    textOutput("age"),
    textOutput("total"),
    textOutput("survRate"),
    br(),
    plotOutput("plotMe")
  )
))