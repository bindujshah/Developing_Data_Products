#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
  
  VAstd <- subset(VA, treat %in% c("1"))
  
  VAtst <- subset(VA, treat %in% c("2"))
  
  model1 <- lm(stime ~ Karn, data = VAstd)
  
  model2 <- lm(stime ~ Karn, data = VAtst)
  
  model1pred <- reactive({
    KarnInput <- input$sliderKarn
    predict(model1, newdata = data.frame(Karn = KarnInput))
  })
  
  model2pred <- reactive({
    KarnInput <- input$sliderKarn
    predict(model2, newdata = data.frame(Karn = KarnInput))
  })
  
  
  output$plot1 <- renderPlot ({
    KarnInput <- input$sliderKarn
    
    
    if(input$RadioTreat=="0"){
      VAstd <- subset(VA, treat %in% c("1"))
        plot(VAstd$Karn, VAstd$stime, xlab = "Karno Performance Score", 
             ylab = "Survivial Time", main="Standard Teatment") 

    }
    if(input$RadioTreat=="1"){
      VAtst <- subset(VA, treat %in% c("2"))
      plot(VAtst$Karn, VAtst$stime, xlab = "Karno Performance Score", 
           ylab = "Survivial Time", main = "Test Treatment")
    }
  
  }) 
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
  
   output$document<-renderText({
"The VA Data Set contains data from a Lung Cancer Study. 
 This page shows the Survival Times as predicted by Karnofsky Scores.
 The User may choose to see the plot of the Standard Treatment or Test Treatment.
 Changing the values of the Karnofsky score changes the Survival TIme prediction."})
  
  })

