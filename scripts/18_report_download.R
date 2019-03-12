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