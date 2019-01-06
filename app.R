#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinycssloaders)

library(foreach)
library(dplyr)
library(Rmpfr)

ui <- fluidPage(
   
   # Application title
   titlePanel("Clicker Heroes Outsiders Optimizer"),
   
   
   ################
   # SidebarPanel #
   sidebarLayout(
      sidebarPanel(
        
        h3("Parameters from the game")
        
        # Input number of AS
        ,numericInput(      "in_as"
                     ,h3(   "Ancient Souls")
                     ,value = 0
                     ,min   = 0
                     ,step  = 1)
        
        # Input Highest Zone Ever
        ,numericInput(      "in_hze"
                     ,h3(   "Highest Zone Ever")
                     ,value = 0
                     ,min   = 0
                     ,step  = 1)
        
        # Input number of sacrificed Hero Souls
        ,textInput(       "in_sac"
                   ,h3(   "Total HS Sacrificed")
                   ,value = "0")
        
        ,h3("Parameters controlling optimization")
        
        # Input Chronos Level
        ,numericInput("chrono_l"
                     ,h4("Achievable level of chronos")
                     ,value = 2000
                     ,min = 0
                     ,step = 1)
        
        # Input time
        ,numericInput("ti"
                      ,h4("Acceptable minimum boss timer")
                      ,value = 3
                      ,min = 2
                      ,step = 1)
        
        # Input Kumawakamaru level
        ,numericInput("kuma_l"
                     ,h4("Achievable level of Kumawakamaru")
                     ,value = 15000
                     ,min = 0
                     ,step = 1)
        
        # Input number of monsters
        ,numericInput("mo"
                     ,h4("Maximum number of monsters at end zone")
                     ,value = 2
                     ,min = 2
                     ,step = 1)
        
        
      # End of sidebarPanel #
      #######################
      ),
      
      
      # Show a plot of the generated distribution
      mainPanel(

      )
   )
)

server <- function(input, output) {
   

}

# Run the application 
shinyApp(ui = ui, server = server)

