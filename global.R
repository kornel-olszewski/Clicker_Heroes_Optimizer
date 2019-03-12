cat("Debug 0: Load libraries\n")

library(foreach)
library(dplyr)

library(here)
library(rmarkdown)

# load scripts declaring functions

cat("Debug 0: Load scripts\n")

here("scripts","01_boss_time.R") %>% source(.,local=FALSE)
here("scripts","02_monsters_zone.R") %>% source(.,local=FALSE)
here("scripts","03_primals.R") %>% source(.,local=FALSE)
here("scripts","04_chest_chance.R") %>% source(.,local=FALSE)

here("scripts","05_grow_cost.R") %>% source(.,local=FALSE)
here("scripts","06_max_lvl.R") %>% source(.,local=FALSE)

here("scripts","07_orphalas_lvl.R") %>% source(.,local=FALSE)
here("scripts","08_borb_lvl.R") %>% source(.,local=FALSE)
here("scripts","09_rhageist_lvl.R") %>% source(.,local=FALSE)
here("scripts","10_sen_akhan_lvl.R") %>% source(.,local=FALSE)

here("scripts","11_pony_chor_distr.R") %>% source(.,local=FALSE)

#here("scripts","12_base_hs.R") %>% source()
#here("scripts","13_tr_hs.R") %>% source()

here("scripts","17_boss_life.R") %>% source(.,local=FALSE)

cat("Debug 0: Declare UI\n")
here("ui.R") %>% source(.,local=FALSE)

cat("Debug 0: Declare Server\n")
here("server.R") %>% source(.,local=FALSE)