library(shiny)
library(datasets)

shinyUI(pageWithSidebar(
  headerPanel('The Motor Trend Data Set'),
  sidebarPanel(
    selectInput('ycol', 'Y Variable', names(mtcars)),
    selectInput('xcol', 'X Variable', names(mtcars)),
    selectInput('colors', 'Colors', names(mtcars[,c(2,9,10,11)]))
  ),
  mainPanel(
    plotOutput('plot1')
  )
))