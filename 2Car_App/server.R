library(shiny)
library(datasets)
library(rCharts)

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  New_data<-reactive({
    mtcars[,c(input$ycol,input$xcol,input$colors)]})
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
    plot(New_data()[,1]~New_data()[,2],data=New_data(),col=(colorData()+3),
        pch = 20, cex = 3,xlab=input$xcol,ylab=input$ycol)
    abline(lm(YData()~XData()))
  })
  
  output$print1<- renderPrint({New_data()})
  
})