# 5. Dora / Sen-Akhan - max_lvl = 18800

seak_lvl = function(max_lvl
                    ,desired_zone
                    ,dora_lvl
                    ,chance
){
  # cat("Parameters (seak_lvl): max_lvl:",max_lvl
  #    ," desired_zone:",desired_zone
  #    ," dora_lvl:",dora_lvl
  #    ," chest chance:",chance,"\n")
  
  dora_levs = foreach( lvl       = 0:max_lvl
                       ,.combine = c
  ) %do% if( chest_chance(lvl           = desired_zone
                          ,sen_akhan_lvl = lvl
                          ,dora_lvl      = dora_lvl) >= chance ) {lvl}
  
  dora_levs %>% min() %>% return()  
}
