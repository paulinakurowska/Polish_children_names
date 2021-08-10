#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(openxlsx)
source("loading_data.R")
# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Polish Children Names"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("Gender",
                        "Select gender:",
                        unique(data$Gender)
        ),
        selectInput("Year",
                    "Select year:",
                    unique(data$Year))
    ),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("barplot")
        )
    )
))
