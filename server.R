cat("Debug 2: Declare Server\n")
server <- function(input, output, session) {
  
  observeEvent(input$optimize, {
    
    cat("Debug 2: Button clicked\n")
    
    a_s                = input$in_as
    assign("a_s", a_s, envir = .GlobalEnv)
    cat("Debug 2: a_s assigned with value: ",a_s,"\n")
    
    hze                = input$in_hze
    assign("hze", hze, envir = .GlobalEnv)
    cat("Debug 2: hze assigned with value: ",hze,"\n")
    
    chronos_level      = input$chrono_l
    assign("chronos_level", chronos_level, envir = .GlobalEnv)
    cat("Debug 2: chronos_level assigned with value: ",chronos_level,"\n")
    
    t                  = input$ti
    assign("t", t, envir = .GlobalEnv)
    cat("Denug 2: t assigned with value: ",t,"\n")
    
    kumawakamaru_level = input$kuma_l
    assign("kumawakamaru_level", kumawakamaru_level, envir = .GlobalEnv)
    cat("Debug 2: kumawakamaru_level assigned with value: ",kumawakamaru_level,"\n")
    
    m                  = input$mo
    assign("m", m, envir = .GlobalEnv)
    cat("Debug 2: m assigned with value: ",m,"\n")
    
    atman_level        = input$atman_l
    assign("atman_level", atman_level, envir = .GlobalEnv)
    cat("Debug 2: atman_level assigned with value: ",atman_level,"\n")
    
    pc                 = input$pch
    assign("pc", pc, envir = .GlobalEnv)
    cat("Debug 2: pc assigned with value: ",pc,"\n")
    
    dora_level         = input$dora_l
    assign("dora_level", dora_level, envir = .GlobalEnv)
    cat("Debug 2: dora_level assigned with value: ",dora_level,"\n")
    
    cc                 = input$cch
    assign("cc", cc, envir = .GlobalEnv)
    cat("Debug 2: cc assigned with value: ",cc,"\n")
    
    reach              = input$limit
    assign("reach", reach, envir = .GlobalEnv)
    cat("Debug 2: reach assigned with value: ",reach,"\n")
    
    cat("Debug 2: >>Execute 14_optimizer.R script<<\n")
    
    here("scripts","14_optimizer.R") %>%
      source(file = .
             , local = T
             , echo = T
      )
    cat("Debug 2: >>End of 14_optimizer.R script execution<<\n")
    
    if(exists("results")){
      
      cat("Debug 2: Computation succesful: Result exists\n")
      output$results = renderTable({results}
                                   ,digits = 0
      )
      
      cat("Debug 2: >>Execute 15_costs.R script<<\n")
      here("scripts","15_costs.R") %>%
        source(file = .
               , local = T
               , echo = T
        ) 
      
      cat("Debug 2: >>End of 15_costs.R script execution<<\n")
      
      output$costs = renderTable({costs})
      
      output$ratio = renderTable({ratio})
      
      cat("Debug 2: >>Execute 16_zone_effects.R<<\n")
      
      here("scripts","16_zone_effects.R") %>%
        source(file = .
               , local = T
               , echo = T
        )
      
      output$effects         = renderDataTable({effects})
      
      output$time_distr      = renderDataTable({time_distr})
      
      output$monsters_distr  = renderDataTable({monsters_distr})
      
      output$primal_ch_distr = renderDataTable({primal_ch_distr})
      
      output$chest_ch_distr  = renderDataTable({chest_ch_distr})
      
      #End of if-exists
    }
    
    output$report = downloadHandler(
      
      filename = "Clicker_Heroes_optimization_results.pdf"
      
      ,content = function(file){
        
        report_path = here("template","template.Rmd") %>% normalizePath()
        
        cat("Debug 5: Value of report_path: ",report_path,"\n")
        
        owd = tempdir() %>% setwd()
        
        on.exit(setwd(owd))
        
        file.copy(report_path
                  ,"Report.Rmd"
                  ,overwrite = TRUE
        )
        
        cat("Debug 5: Declaring list of parameters\n")
        params = list(
          in_as = a_s
          ,in_hze = hze
          ,desired_zone = desired_zone
          ,chrono_l = chronos_level
          ,ti = t
          ,kuma_l = kumawakamaru_level
          ,mo = m
          ,atman_l = atman_level
          ,pch = pc
          ,dora_l = dora_level
          ,cch = cc
          ,limit = reach
          ,results = results
          ,costs = costs
          ,ratio = ratio
          ,effects = effects
          ,time_distr = time_distr
          ,monsters_distr = monsters_distr
          ,primal_ch_distr = primal_ch_distr
          ,chest_ch_distr = chest_ch_distr
        )
        
        cat("Debug 5: Parameters passed to report\n")
        print(params)
        assign("params", params, envir = .GlobalEnv)
        
        out = rmarkdown::render("Report.Rmd"
                                ,output_format = "pdf_document"
                                ,params = params
                                ,envir = new.env(parent = globalenv())
        )
        
        file.rename(out,file)
        #End of content
      }
      
      #End of downloadHandler
    )
    
    
    #End of observeEvent(input$optimize,
  })
  
   
  
  
  # End of server 
}