# 6. Ponyboy vs Chor'gorloth benefit
# based on u/aperfectring 's spreadsheet
# Number of AS to be distributed to Ponyboy and Chor'gorloth

distr = function(as_pc,max_lvl){
  
  pony_tbl = foreach( lvl = seq( max_lvl ,0 ,-1 )
                      ,.combine = rbind 
  ) %do%
    data_frame(
      pony            = lvl
      ,pony_cost       = grow_cost_lvl(lvl)  
      ,chor            = (1+8*(as_pc - grow_cost_lvl(lvl))) %>% sqrt() %>% `-`(1) %>% `/`(2) %>% floor() %>% min(.,150)
      ,chor_cost       = (1+8*(as_pc - grow_cost_lvl(lvl))) %>% sqrt() %>% `-`(1) %>% `/`(2) %>% floor() %>% min(.,150) %>% grow_cost_lvl()
      ,overall_benefit = (pony^2 * 10 + 1) * (( 1 / 0.95 )^chor)
    ) %>%
    filter(.
           , pony >= chor
    ) %>%
    select(.,pony,chor,overall_benefit)
  
  chor_tbl = foreach( lvl = min( max_lvl ,150 ) %>% seq( . ,0 ,-1 )
                      ,.combine = rbind 
  ) %do%
    data_frame(
      pony            = (1+8*(as_pc - grow_cost_lvl(lvl))) %>% sqrt() %>% `-`(1) %>% `/`(2) %>% floor()
      ,pony_cost       = (1+8*(as_pc - grow_cost_lvl(lvl))) %>% sqrt() %>% `-`(1) %>% `/`(2) %>% floor() %>% grow_cost_lvl()
      ,chor            = lvl
      ,chor_cost       = grow_cost_lvl(lvl)
      ,overall_benefit = (pony^2 * 10 + 1) * (( 1 / 0.95 )^chor)
    ) %>%
    filter(.
           , chor >= pony
    ) %>%
    select(.,pony,chor,overall_benefit)
  
  pony_chor_lvl = union_all(pony_tbl,chor_tbl) %>%
    filter(.,overall_benefit == max(overall_benefit)) %>%
    distinct() %>%
    select(.,pony,chor)
  
  return(pony_chor_lvl)
  
}