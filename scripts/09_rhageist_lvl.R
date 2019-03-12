# 3. Atman / Rhageist - OK - max_lvl = 2900

rhag_lvl = function(max_lvl
                    ,desired_zone
                    ,atman_lvl
                    ,chance
){
  # cat("Parameters (borb_lvl): max_lvl:",max_lvl
  #    ," desired_zone:",desired_zone
  #    ," atman_lvl:",atman_lvl
  #    ," primal chance:",chance,"\n")
  
  atm_levs = foreach( lvl      = 0:max_lvl
                      ,.combine = c
  ) %do% if( primals(lvl        = desired_zone
                     ,rhag_lvl   = lvl
                     ,atman_lvl  = atman_lvl) >= chance ) {lvl}
  
  atm_levs %>% min() %>% return()
}