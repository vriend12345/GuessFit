# server.R

library(shiny)

seed <- round(abs(rnorm(1)*1000))
set.seed(seed)
x <- rnorm(100)
alpha <- rnorm(1, sd=2)
y <- alpha * x + rnorm(100)

shinyServer(
  function(input, output){
    
    output$GuessFit <- renderPlot({
      plot(x, y, pch=19)
      abline(a = input$intercept, b = input$slope, col = "blue", lwd = 2)
      legend("topright", lty = 1, col="blue", legend="guessed fit")
    })
    
    output$SolFit <- renderPlot({
      if (input$showfit > 0)
        {
          plot(x, y, pch=19)
          abline(a = input$intercept, b = input$slope, col = "blue", lwd = 2)
          abline(lm(y ~ x), col = "red", lwd = 2)
          legend("topright", lty = c(1,1), col=c("blue","red"), 
                 legend=c("guessed fit","best fit"))
        }
    })
  }
)

