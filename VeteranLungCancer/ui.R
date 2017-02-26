#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)



# Define UI for application that draws a histogram
shinyUI (fluidPage(
  
  # Application title
  titlePanel("Veteran Lung Cancer"),
  
  # Sidebar with a slider input fo
  sidebarLayout(
    sidebarPanel(
   #   sliderInput("sliderAge", "Age", 34, 81, value = 62),
      sliderInput("sliderKarn", "Karnofsky Performace Score", 10, 99, value = 60),
      radioButtons("RadioTreat","Treatment", c("Standard" = "0", "Test" = "1")))
   
  #    submitButton("Submit")
    ,
    mainPanel (
      tabsetPanel(
        tabPanel("Results", 
      plotOutput("plot1"), 
      h3("Predicted Survivial Time from Standard Treatment:"),
      textOutput("pred1" ),
      h3("Predicted Survival Time from Test Treatment:" ),
      textOutput("pred2" )),
      tabPanel("Documentation", verbatimTextOutput("document"))
    )
  )
)
)
)