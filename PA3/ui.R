library(shiny)
data(mtcars)
shinyUI(fluidPage(
    titlePanel("Predicting Horse Power using Displacement"),
    sidebarLayout(
        sidebarPanel(
            
            sliderInput("sliderdisp","Choose the disp value!",72,472,value = 20),
            
            checkboxInput("showmod1","Show/Hide the model ",value=TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Horse Power is:"),
            textOutput("pred1")
        )
    )
    
))
