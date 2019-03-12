outsider_ratio = function(distribution){
  distribution %>% 
    transmute(.
              ,ind =if_else(Outsider %in% c("Chor'gorloth","Phandoryss","Ponyboy")
                            ,"Efficiency"
                            ,"Range"
              )
              ,cost=if_else(Outsider=="Phandoryss"
                            ,Level
                            ,sapply(Level,grow_cost_lvl) %>% as.double()
              )
    ) %>%
    group_by(.,ind) %>%
    summarise(.,sum_cost = sum(cost)) %>%
    mutate(.,share = (sum_cost / sum(sum_cost)) %>% `*`(100) %>% sprintf("%-2.2f%%", .)
    )
}

costs = results %>% outsider_ratio()

ratio = (costs %>% filter(.,ind=="Range")      %>% select(.,sum_cost) /
           costs %>% filter(.,ind=="Efficiency") %>% select(.,sum_cost)
)                                  %>% 
  `*`(100) %>% sprintf("%-2.2f%%", .) %>%
  tibble::as_tibble()                 %>% 
  rename(.,"Range/Efficiency Ratio"=value)

assign("costs", costs, envir = .GlobalEnv)
assign("ratio", ratio, envir = .GlobalEnv)