library(shiny)
library(datasets)

shinyUI(
  fluidPage(
    titlePanel("Telephones by Year"),
    sidebarLayout(
      sidebarPanel(
        selectInput("year","Year:",choices=rownames(WorldPhones)),
        hr(),
        helpText("Data from AT&T")),
      mainPanel(
        plotOutput("phonePlot")
      )    
    )
  )
)