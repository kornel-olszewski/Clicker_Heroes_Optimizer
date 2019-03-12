# 2. Kumawakamaru / Borb - OK - max_lvl = 3800

borb_lvl = function(max_lvl
                    ,desired_zone
                    ,kumawakamaru_lvl
                    ,monsters
){
   # cat("Parameters (borb_lvl): max_lvl:",max_lvl
   #     ," desired_zone:",desired_zone
   #     ," kumawakamaru_lvl:",kumawakamaru_lvl
   #     ," monsters:",monsters,"\n")
  
  kum_levs = foreach( lvl      = 0:max_lvl
                      ,.combine = c
  ) %do% if( monsters_zone(lvl         = desired_zone
                           ,borb_lvl    = lvl
                           ,kuma_lvl    = kumawakamaru_lvl) <= monsters ) {lvl}
  
  # print(kum_levs)
  kum_levs %>% min() %>% return()
}