library(datasets)
data(Titanic)
titanic <- as.data.frame(Titanic)

shinyServer(
  function(input, output) {
    output$class <- renderText({
      paste("Class = ", input$class)
    })
    
    output$sex <- renderText({
      paste("Sex = ", input$sex)
    })
    
    output$age <- renderText({
      paste("Age = ", input$age)
    })
    
    output$total <- renderText({
      paste("Total number of people in selection: ", 
            sum(titanic[titanic$Class == input$class &
                     titanic$Sex == input$sex &
                     titanic$Age == input$age,5]))
    })
    
    output$survRate <- renderText({
      paste(round((sum(titanic[titanic$Class == input$class &
                           titanic$Sex == input$sex &
                           titanic$Age == input$age &
                           titanic$Survived == 'Yes',5])/
               sum(titanic[titanic$Class == input$class &
                             titanic$Sex == input$sex &
                             titanic$Age == input$age,5])) * 100,2),
            "% Survivor Rate")
    })
    
    output$plotMe <- renderPlot({
      bargraph <- barplot(titanic[titanic$Class == input$class &
                    titanic$Sex == input$sex &
                    titanic$Age == input$age,5],
              col=c("red","green"),
              names.arg = titanic[titanic$Class == input$class &
                                    titanic$Sex == input$sex &
                                    titanic$Age == input$age,4],
              ylab="Number of Survivors",
              xlab="Survived")
      text(bargraph, titanic[titanic$Class == input$class &
                                       titanic$Sex == input$sex &
                                       titanic$Age == input$age,5],
                             labels=titanic[titanic$Class == input$class &
                                              titanic$Sex == input$sex &
                                              titanic$Age == input$age,5],
                             pos=1, offset=.2)
    })
  }
)