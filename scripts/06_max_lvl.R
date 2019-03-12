# Max available level for Outsiders with growing costs
max_lvl = function(as_in) { 
  #cat("Parameters (max_lvl): lvl:",lvl,"\n")
  
  (1+8*as_in) %>% 
    sqrt() %>% 
    `-`(1) %>% 
    `/`(2) %>% 
    floor() %>% 
    return() 
  
}