library(shiny)
library(datasets)
library(markdown)

shinyUI(navbarPage ("Navbar" ,
         tabPanel("Plot",          
         headerPanel('The Motor Trend Data Set'),
         sidebarPanel(
             selectInput('ycol', 'Y Variable', names(mtcars)),
             selectInput('xcol', 'X Variable', names(mtcars)),
             selectInput('colors', 'Colors', names(mtcars[,c(2,9,10,11)]))
            ),
         mainPanel(
            plotOutput('plot1')
            )),
         tabPanel("Documentation",
                  fluidRow (column(6,includeMarkdown("Documentation.Rmd")) )
         )))
