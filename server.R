library(shiny)
library(plotly)
library(dplyr)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$barplot <- renderPlotly({

        plot_data <- data %>% 
            filter(Gender == input$Gender, Year == input$Year) %>% 
            arrange(desc(Counts)) 
        
        top_data <- plot_data %>% 
            slice(1:20)
        title_string <- paste0("Children born: ", as.character(sum(plot_data$Counts)), " in year ", 
                               as.character(input$Year))
        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')
        ggplotly(top_data %>% 
                     ggplot(aes(x = reorder(Name, Counts), y = Counts, fill = Name, group = Name)) +
                     geom_bar(stat = "identity") +
                     theme_classic() +
                     theme(legend.position = "none")+
                     coord_flip()+
                     xlab("Name")+
                     ggtitle(title_string))
    })

})
