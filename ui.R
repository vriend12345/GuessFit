# ui.R

library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Guess the fit ! - Linear Regression"),
  
  sidebarPanel(
        
      sliderInput(inputId = "intercept", label = "Intercept: ",
                  min = -5, max = 5, value = 0, step = 0.05),
    
      sliderInput(inputId = "slope", label = "Slope: ",
                  min = -5, max = 5, value = 0, step = 0.05),
      
      actionButton(inputId = "showfit", label="Show the solution")
    ),
  
  mainPanel(
      
      h5('How "Guess the Fit!" works ?'),
      h5('======================================================='),
      h6('Guess the Fit! read the two values slope and intercept 
        and plot a blue line regarding these two values.'),  
      h6('You can change these two values using the two sliders and the plot will 
        change automatically.'),
      h6('When you finish you can press Show the solution button and this will show 
         another plot with the guessed fit in blue color 
         and the best fit that R find using lm function in red color.'),
      h4("Change the intercept and the slope using the  sliders in the sidebar panel
         to guess the best fit for the data"),
      plotOutput(outputId = "GuessFit"),
      plotOutput(outputId = "SolFit")
    )
  
))