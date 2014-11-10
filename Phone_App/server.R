library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
flip<-t(WorldPhones)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a barplot
    barplot(flip[,input$year], 
            main=input$year,
            ylab="Number of Telephones",
            xlab="Year", col="dark blue")
    
  })
})