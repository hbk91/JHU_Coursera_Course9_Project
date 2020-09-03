#' @title Plaay with CLT 
#' @docType Shiny App UI
#' @author Aman Jindal
#' @description This project gives example of how Central Limit Theorem works. It plots the distribution of the means of random samples 
#' generated out of an exponential distribution. User needs to choose from a GUI the number of simulations, the sample size and the mean of the exponential
#' distribution to view the result  

library(shiny)

shinyUI(fluidPage(
    titlePanel(title = h1("Play with Central Limit Theorem", align = "center"), 
               windowTitle = 'Play with CLT'),
    sidebarLayout(
        sidebarPanel( 
            width = 3,
            sliderInput(
                inputId = 'sliderNsim',
                label = 'Please choose number of simulations',
                min = 100,
                max = 2000,
                value = 1000,
                step = 50),
            
            sliderInput(
                inputId = 'sliderSampleSize',
                label = 'Please choose the sample size',
                min = 10,
                max = 100,
                value = 40,
                step = 5),
            
            selectInput(
                inputId = 'selectedMean',
                label = 'Please choose the mean of exponential distribution',
                choices = 4:8,
                selected = 5
            ),
            
            submitButton(text = 'Submit')
        ),
        
        mainPanel(
            width = 9,
            plotOutput('plot1'),
            br(),br(),
            h4('Central limit theorem states that if you have a population with mean μ and standard deviation σ and 
               take sufficiently large random samples from the population with replacement, then the distribution of the 
               sample means will be approximately normally distributed.'), 
            h4('In our case, we have taken an exponential distribution. As we increase the number of simulations and the 
               sample size, we can see that the distribution of the means of the samples becomes more normal')
            )
        )
    ))
