cat("Debug 1: Declare UI\n")
ui <- fluidPage(
  
  # Application title
  titlePanel("Clicker Heroes Outsiders Optimizer")

  ,sidebarLayout(
    
    # Declare whole UI through sourcing external script
    here("ui","ui_inputs.R") %>% 
    source(file = ., local = T) %>%
    sidebarPanel(.,width = 2)
    
    # Right side of UI
     ,mainPanel(
         
         actionButton("optimize","Optimize")
         
         ,downloadButton("report", "Download as PDF")
         
         ,tabsetPanel(
           #Read contents of each tab from script
           
           #Tab 1
           here("ui","ui_tab1.R") %>% 
           source(file = .,local = T) %>%
           tabPanel("Outsiders' distribution",.)
           
           #Tab 2
           ,here("ui","ui_tab2.R") %>% 
            source(file = .,local = T) %>%
            tabPanel("Outsiders' costs",.)
           
           #Tab 3
           ,here("ui","ui_tab3.R") %>% 
            source(file = .,local = T) %>%
            tabPanel("Zone effects",.)
           
           # End of tabsetPanel #
           ####################    
         )
         # End of mainPanel #
         ####################
       )
      
      
    # End of sidebarLayout #
    ########################
  )
)