#' @author Aman Jindal
#' @description This is the server for the 'Understanding Central Limit Theorem' Shiny Project
#' @param input$sliderNsim is the number of simulations desired by the user 
#' @param input$sliderSampleSize is the resampling size desired by the user 
#' @param input$selectedMean is the mean of the exponential distribution desired by the user
#' @return output$plot1 is the plot of the distribution of the means of the samples  

library(shiny)
library(ggplot2)
library(data.table)
library(roxygen2)

shinyServer(function(input, output) {
    
    output$plot1 <- renderPlot(width = 900, height = 450, expr = {
        
        nsim <- as.numeric(input$sliderNsim)
        sample_size <- as.numeric(input$sliderSampleSize)
        lambda <- 1/as.numeric(input$selectedMean)
        set.seed(1234)
        
        simulations <- matrix(data=rexp(n=nsim*sample_size,rate=lambda), nrow=nsim, ncol=sample_size)
        means_summary <- data.table(means=rowMeans(x=simulations))
        means_summary[, ExpRandoms := rexp(n=nsim, rate=lambda)]
        
        simulation_mean <- mean(means_summary[,means])
        theorertical_mean <- 1/lambda
        simulation_mean_label <- paste('Simulation Mean = ',round(simulation_mean,4))
        theoretical_mean_label <- paste('Theoretical Mean = ',round(theorertical_mean,4))
        
        simulation_sd <- sd(means_summary[,means])
        theoretical_sd <- 1/lambda/sqrt(sample_size)
        
        binwidth <- lambda
        ggplot(data=means_summary, mapping=aes(x=means)) + 
            geom_histogram(mapping=aes(x=means, color='MeanExpRandom'), binwidth = binwidth, fill=NA, na.rm = TRUE) +
            geom_histogram(mapping=aes(x=ExpRandoms, color='ExpRandom'), binwidth = binwidth, fill=NA, na.rm = TRUE) +
            stat_function(fun = function(x, mean, sd, n) n*dnorm(x=x, mean=mean, sd=sd), 
                          args = list(mean=simulation_mean, sd=simulation_sd, n=nsim*binwidth), na.rm = TRUE) +
            geom_vline(mapping=aes(xintercept=simulation_mean, color='SimulationMean')) +
            geom_vline(mapping=aes(xintercept=1/lambda, color='TheoreticalMean')) +
            labs(title='Distribution of Sample Means and Random Exponentials') +  
            labs(x='Mean/Value of Random Exponential', y='Count') +
            scale_color_manual(name = "", values = 
                                   c(MeanExpRandom='black', ExpRandom='green', 
                                     SimulationMean = "blue", TheoreticalMean = "red"),
                               labels=c(MeanExpRandom='Sampling Distribution', ExpRandom='Random Exponentials',
                                        SimulationMean=simulation_mean_label, TheoreticalMean=theoretical_mean_label)) + 
            xlim(0,1/lambda^2) + ylim(0, nsim*binwidth) +
            theme(plot.title = element_text(size = 22, face = 'bold'), legend.position = 'bottom',
                  text = element_text(size = 16), aspect.ratio = 0.35)
    })
    
})
