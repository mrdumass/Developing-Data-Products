library(shiny)
library(datasets)

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  XData <- reactive({
    mtcars[,input$xcol]
  })    
  YData <- reactive({
    mtcars[,input$ycol]
  })    
  colorData    <- reactive({
    mtcars[,input$colors]
  })

  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(XData(),YData(),col=(colorData()+3),
        pch = 20, cex = 3,xlab=input$xcol,ylab=input$ycol)
    abline(lm(YData()~XData()))
  })
  
})