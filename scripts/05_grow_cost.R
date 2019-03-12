# Cumulative cost of Outsider
grow_cost_lvl = function(lvl) {
  #cat("Parameters (grow_cost_lvl): lvl:",lvl,"\n")
  
  if(lvl<=0) return(0)
  
  lvl %>% 
    seq(0,.) %>% 
    sum() %>% 
    return()
  
}