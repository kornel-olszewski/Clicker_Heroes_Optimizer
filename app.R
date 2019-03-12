# Clicker Heroes Optimizer
#
# Created by: Kornel Olszewski (kornel.olszewski@o2.pl)
# 
# Application optimizes distribution of Ancient Souls
# among Outsiders based on user-provided parameters

library(shiny)

# Run the application 
shinyApp(  ui      = ui
         , server  = server
         , onStart = function() {
           cat("Debug 2.5: Doing application setup\n")
         }
         )

