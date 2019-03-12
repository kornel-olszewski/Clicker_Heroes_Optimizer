# 1. Chronos / Orphalas - OK - max_lvl = 1200

orphalas_lvl = function(max_lvl
                        ,desired_zone
                        ,chronos_lvl
                        ,tm
){
  # cat("Parameters (orphalas_lvl): max_lvl:",max_lvl
  #                         ," desired_zone:",desired_zone
  #                         ," chronos_lvl:",chronos_lvl
  #                         ," tm:",tm,"\n")
  
  chr_levs = foreach( lvl      = 0:max_lvl
                      ,.combine = c
  ) %do% if( boss_time(lvl        = desired_zone
                       ,orph_lvl   = lvl
                       ,chr_lvl    = chronos_lvl) >= tm ) {lvl}
  
  chr_levs %>% min() %>% return()
}