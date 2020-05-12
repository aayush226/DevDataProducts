library(shiny)

shinyServer(function(input,output){
    model1<- lm(hp~disp,data=mtcars)
    pred1<-reactive({
        dispinput<-input$sliderdisp
        predict(model1,newdata=data.frame(disp=dispinput))
    })

    output$plot1<-renderPlot({
        dispinput<-input$sliderdisp
        plot(y=mtcars$hp,x=mtcars$disp,xlab="disp",ylab="HP",bty="n",pch=16,xlim=c(10,35),ylim=c(50,350))
        if(input$showmod1){
            abline(model1,col="red",lwd=2)
            
        }
        
        points(dispinput,pred1(),col="red",cex=2,pch=16)

    }) 
    output$pred1<-renderText({
        pred1()
    })
})