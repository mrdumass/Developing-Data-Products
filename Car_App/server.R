library(shiny)
library(datasets)

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    mtcars[, c(input$xcol, input$ycol)]
  })    
  colorData    <- reactive({
    mtcars[,input$colors]
  })

  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),col=(colorData()+3),
        pch = 20, cex = 3)
  })
  
})