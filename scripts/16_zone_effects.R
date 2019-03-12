cat("Debug 4: Begin script 16_zone_effects.R\n")

levs = seq( 1, desired_zone %/% 500 + 300 )

v_boss_time     = Vectorize(boss_time    ,"lvl")
v_monsters_zone = Vectorize(monsters_zone,"lvl")
v_primals       = Vectorize(primals      ,"lvl")
v_chest_chance  = Vectorize(chest_chance ,"lvl")
v_boss_life     = Vectorize(boss_life    ,"lvl")


effects = data_frame(lvl_500 = levs
                     ,lvl_0 = (levs - 1) * 500
                     ,lvl_1 = levs * 500 - 1
                     ,boss_timer = v_boss_time(lvl_1
                                               ,results %>% filter(.,Outsider == "Orphalas") %>% select(.,Level) %>% unlist()
                                               ,chronos_level)
                     ,mnstrs_zn  = v_monsters_zone(lvl_1
                                                   ,results %>% filter(.,Outsider == "Borb") %>% select(.,Level) %>% unlist()
                                                   ,kumawakamaru_level)
                     ,primal_ch  = v_primals(lvl_1
                                             ,results %>% filter(.,Outsider == "Rhageist") %>% select(.,Level) %>% unlist()
                                             ,atman_level) * 100
                     ,chest_chnc = v_chest_chance(lvl_1
                                                  ,results %>% filter(.,Outsider == "Sen-Akhan") %>% select(.,Level) %>% unlist()
                                                  ,dora_level) * 100
                     ,boss_hlth  = v_boss_life(lvl_1
                                               ,results %>% filter(.,Outsider == "K'Ariqua") %>% select(.,Level) %>% unlist()
                                               ,19000)
)
assign("effects", effects, envir = .GlobalEnv)

cat("Minimal reasonable boss time: \n")
time_distr = bind_rows(
  effects %>%
    filter(.,boss_timer >= 10) %>%
    select(.,lvl_500,lvl_0,lvl_1,boss_timer) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,boss_timer >= 9) %>%
    select(.,lvl_500,lvl_0,lvl_1,boss_timer) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,boss_timer >= 8) %>%
    select(.,lvl_500,lvl_0,lvl_1,boss_timer) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,boss_timer >= 7) %>%
    select(.,lvl_500,lvl_0,lvl_1,boss_timer) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,boss_timer >= 6) %>%
    select(.,lvl_500,lvl_0,lvl_1,boss_timer) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,boss_timer >= 5) %>%
    select(.,lvl_500,lvl_0,lvl_1,boss_timer) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,boss_timer >= 4) %>%
    select(.,lvl_500,lvl_0,lvl_1,boss_timer) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,boss_timer >= 3) %>%
    select(.,lvl_500,lvl_0,lvl_1,boss_timer) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,boss_timer >= 2) %>%
    select(.,lvl_500,lvl_0,lvl_1,boss_timer) %>% filter(.,lvl_500 == max(lvl_500) )
) %>%
  transmute(.
            ,lvl_500 = lvl_500
            ,lvl_0 = lvl_0
            ,lvl_1 = lvl_1
            ,boss_timer = boss_timer %>% sprintf("%.0g", .)
            )
assign("time_distr", time_distr, envir = .GlobalEnv)

cat("Distribution of number of monsters: \n")
monsters_distr = bind_rows(
  effects %>% 
    filter(.,mnstrs_zn <= 2) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 3 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 4 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 5 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 6 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 7 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 8 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 9 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 10 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 11 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 12 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 13 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 14 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>% 
    filter(.,mnstrs_zn <= 15 ) %>% 
    select(.,lvl_500,lvl_0,lvl_1,mnstrs_zn) %>% filter(.,lvl_500 == max(lvl_500) )
) %>%
  transmute(.
            ,lvl_500 = lvl_500
            ,lvl_0 = lvl_0
            ,lvl_1 = lvl_1
            ,mnstrs_zn = mnstrs_zn %>% sprintf("%.2g",.)
  )
assign("monsters_distr", monsters_distr, envir = .GlobalEnv)

cat("Distribution of primal boss chance: \n")
primal_ch_distr = bind_rows(
  effects %>%
    filter(.,primal_ch >= 100) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 95) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 90) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 85) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 80) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 70) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 60) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 50) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 40) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 30) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 20) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 10) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,primal_ch >= 5) %>%
    select(.,lvl_500,lvl_0,lvl_1,primal_ch) %>% filter(.,lvl_500 == max(lvl_500) )
) %>%
  transmute(.
            ,lvl_500 = lvl_500
            ,lvl_0 = lvl_0
            ,lvl_1 = lvl_1
            ,primal_ch = primal_ch %>% sprintf("%.2g",.)
  )
assign("primal_ch_distr", primal_ch_distr, envir = .GlobalEnv)

# Distribution of treasure chest chance
chest_ch_distr = bind_rows(
  effects %>%
    filter(.,chest_chnc >= 100) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 95) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 90) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 85) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 80) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 70) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 60) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 50) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 40) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 30) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 20) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 10) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
  ,effects %>%
    filter(.,chest_chnc >= 5) %>%
    select(.,lvl_500,lvl_0,lvl_1,chest_chnc) %>% filter(.,lvl_500 == max(lvl_500) )
) %>%
  transmute(.
            ,lvl_500 = lvl_500
            ,lvl_0 = lvl_0
            ,lvl_1 = lvl_1
            ,chest_chnc = chest_chnc %>% sprintf("%.2g",.)
  )
assign("chest_ch_distr", chest_ch_distr, envir = .GlobalEnv)

effects = effects %>%
  transmute(.
            ,lvl_500 = lvl_500
            ,lvl_0 = lvl_0
            ,lvl_1 = lvl_1
            ,boss_timer = boss_timer %>% sprintf("%.0g", .)
            ,mnstrs_zn  = mnstrs_zn %>% sprintf("%.2g",.)
            ,primal_ch  = primal_ch %>% sprintf("%.2g",.)
            ,chest_chnc = chest_chnc %>% sprintf("%.2g",.)
            ,boss_hlth  = boss_hlth
            )

cat("Debug 4: End of script 16_zone_effects.R\n")