cat("Debug 3: >>Begin optimizer.R script<<\n")
zone_gain = 1
mx = max_lvl(a_s)

cat("Debug 3: Begin repeat loop\n")
cat("Debug 3: Available parameters:\n")
cat("Debug 3: a_s       =",a_s,"\n")
cat("Debug 3: hze       =",hze,"\n")
cat("Debug 3: reach     =",reach,"\n")
cat("Debug 3: zone_gain =",zone_gain,"\n")
cat("Debug 3: mx        =",mx,"\n")
first = TRUE

repeat{
  
  cat("Debug 3: loop 1: zone_gain=",zone_gain,"\n")
  
  desired_zone = ( (hze * zone_gain) %/% 500 ) * 500
  cat("Debug 3: loop 1: desired_zone=",desired_zone,"\n")
  
  limited_zone = (reach * desired_zone) %/% 500 *500
  cat("Debug 3: loop 1: limited_zone=",limited_zone,"\n")
  
  orphalas = orphalas_lvl(max_lvl       = mx
                          ,desired_zone = limited_zone
                          ,chronos_lvl  = chronos_level
                          ,tm           = t
  )
  cat("Debug 3: loop 1: orphalas=",orphalas,"\n")
  
  borb = borb_lvl(max_lvl           = mx
                  ,desired_zone     = desired_zone
                  ,kumawakamaru_lvl = kumawakamaru_level
                  ,monsters         = m
  )
  cat("Debug 3: loop 1: borb=",borb,"\n")
  
  rhageist = rhag_lvl(max_lvl       = mx
                      ,desired_zone = limited_zone
                      ,atman_lvl    = atman_level
                      ,chance       = pc
  )
  cat("Debug 3: loop 1: rhageist=",rhageist,"\n")
  
  sen_akhan = seak_lvl(max_lvl       = mx
                       ,desired_zone = limited_zone
                       ,dora_lvl     = dora_level
                       ,chance       = cc
  )
  cat("Debug 3: loop 1: sen_akhan=",sen_akhan,"\n")
  
  kariqua = ( a_s - 
                grow_cost_lvl(orphalas) - 
                grow_cost_lvl(borb)     - 
                grow_cost_lvl(rhageist) - 
                grow_cost_lvl(sen_akhan) 
  ) %>% max(.,0) %>% max_lvl()
  cat("Debug 3: loop 1: kariqua=",kariqua,"\n")
  
  as_spent = grow_cost_lvl(orphalas) + 
             grow_cost_lvl(borb)     + 
             grow_cost_lvl(rhageist) + 
             grow_cost_lvl(kariqua)  +
             grow_cost_lvl(sen_akhan)
  cat("Debug 3: loop 1: as_spent=",as_spent,"\n")
  
  as_pc = a_s - as_spent
  cat("Debug 3: loop 1: as_pc=",as_pc,"\n")
  
  if( as_pc <= 0 )
  {
    if( first ) 
    {
      cat("Debug 3: loop 1: unable to optimize - insufficient AS for provided parameters")
      break
    }
    zone_gain = zone_gain - 0.01
    cat("Debug 3: loop 1: converged at zone_gain=",zone_gain,"\n")
    break
  }
  zone_gain = zone_gain + 0.01
  first = FALSE
  
  # End of Repeat
}

cat("Debug 3: End repeat loop and begin for loop\n")

mult_0 = zone_gain - 0.01
mult_1 = zone_gain + 0.01
cat("Debug 3: mult_0=",mult_0," mult_1=",mult_1,"\n")

zone_0 = ( (hze * mult_0) %/% 500 ) * 500
zone_1 = ( (hze * mult_1) %/% 500 + 1) * 500
cat("Debug 3: zone_0=",zone_0," zone_1=",zone_1,"\n")

fine_zone = seq(zone_0,zone_1,500)
cat("Debug 3: fine_zone=",fine_zone,"\n")

for(zone in fine_zone){
  
  desired_zone = zone
  cat("Debug 3: loop 2: desired_zone=",desired_zone,"\n")
  
  limited_zone = (reach * desired_zone) %/% 500 *500
  cat("Debug 3: loop 2: limited_zone=",limited_zone,"\n")
  
  orphalas = orphalas_lvl(max_lvl       = mx
                          ,desired_zone = limited_zone
                          ,chronos_lvl  = chronos_level
                          ,tm           = t
  )
  cat("Debug 3: loop 2: orphalas=",orphalas,"\n")
  
  borb = borb_lvl(max_lvl           = mx
                  ,desired_zone     = desired_zone
                  ,kumawakamaru_lvl = kumawakamaru_level
                  ,monsters         = m
  )
  cat("Debug 3: loop 2: borb=",borb,"\n")
  
  rhageist = rhag_lvl(max_lvl       = mx
                      ,desired_zone = limited_zone
                      ,atman_lvl    = atman_level
                      ,chance       = pc
  )
  cat("Debug 3: loop 2: rhageist=",rhageist,"\n")
  
  sen_akhan = seak_lvl(max_lvl       = mx
                       ,desired_zone = limited_zone
                       ,dora_lvl     = dora_level
                       ,chance       = cc
  )
  cat("Debug 3: loop 2: sen_akhan=",sen_akhan,"\n")
  
  kariqua = ( a_s - 
                grow_cost_lvl(orphalas) - 
                grow_cost_lvl(borb)     - 
                grow_cost_lvl(rhageist) - 
                grow_cost_lvl(sen_akhan) 
  ) %>% max(.,0) %>% max_lvl()
  cat("Debug 3: loop 2: kariqua=",kariqua,"\n")
  
  as_spent = grow_cost_lvl(orphalas) + 
    grow_cost_lvl(borb)     + 
    grow_cost_lvl(rhageist) + 
    grow_cost_lvl(kariqua)  +
    grow_cost_lvl(sen_akhan)
  cat("Debug 3: loop 2: as_spent=",as_spent,"\n")
  
  as_pc = a_s - as_spent
  cat("Debug 3: loop 2: as_pc=",as_pc,"\n")
  
  if( as_pc <= 0 )
  {
    desired_zone = zone - 500
    cat("Debug 3: loop 2: converged at zone=",desired_zone,"\n")
    break;
  }
  
}

cat("Debug 3: Convergence zone: ",desired_zone,"\n")

limited_zone = (reach * desired_zone) %/% 500 *500
cat("Debug 3: limited_zone=",limited_zone,"\n")

cat("Debug 3: Calculate Outsiders final distribution\n")

orphalas = orphalas_lvl(max_lvl       = mx
                        ,desired_zone = limited_zone
                        ,chronos_lvl  = chronos_level
                        ,tm           = t
)
cat("Debug 3: orphalas=",orphalas,"\n")

borb = borb_lvl(max_lvl           = mx
                ,desired_zone     = desired_zone
                ,kumawakamaru_lvl = kumawakamaru_level
                ,monsters         = m
)
cat("Debug 3: borb=",borb,"\n")

rhageist = rhag_lvl(max_lvl       = mx
                    ,desired_zone = limited_zone
                    ,atman_lvl    = atman_level
                    ,chance       = pc
)
cat("Debug 3: rhageist=",rhageist,"\n")

sen_akhan = seak_lvl(max_lvl       = mx
                     ,desired_zone = limited_zone
                     ,dora_lvl     = dora_level
                     ,chance       = cc
)
cat("Debug 3: sen_akhan=",sen_akhan,"\n")

kariqua = ( a_s - 
              grow_cost_lvl(orphalas) - 
              grow_cost_lvl(borb)     - 
              grow_cost_lvl(rhageist) - 
              grow_cost_lvl(sen_akhan) 
) %>% max(.,0) %>% max_lvl()
cat("Debug 3: kariqua=",kariqua,"\n")

as_spent = grow_cost_lvl(orphalas) + 
  grow_cost_lvl(borb)     + 
  grow_cost_lvl(rhageist) + 
  grow_cost_lvl(kariqua)  +
  grow_cost_lvl(sen_akhan)
cat("Debug 3: as_spent=",as_spent,"\n")

as_pc = a_s - as_spent
cat("Debug 3: as_pc=",as_pc,"\n")

max_lev = max_lvl(as_pc)
pony_chor_lvl = distr(as_pc,max_lev)

pony = pony_chor_lvl %>% select(.,pony)

chor = pony_chor_lvl %>% select(.,chor)

xyl_lev = ( a_s - grow_cost_lvl(chor[[1]]) - grow_cost_lvl(pony[[1]]) - as_spent ) %>% max(.,0) %>% max_lvl()

out_0 = data_frame(Outsider = "Xyliqil"
                   ,Level   = xyl_lev
)
out_1 = data_frame(Outsider = "Chor'gorloth"
                   ,Level   = chor[[1]]
) 
out_2 = data_frame(Outsider = "Phandoryss"
                   ,Level   = ( a_s - grow_cost_lvl(chor[[1]]) - grow_cost_lvl(pony[[1]]) - grow_cost_lvl(xyl_lev) - as_spent ) %>% max(.,0)
)
out_3 = data_frame(Outsider = "Ponyboy"
                   ,Level   = pony[[1]]
)
out_4 = data_frame(Outsider = "Borb"
                   ,Level   = borb
)
out_5 = data_frame(Outsider = "Rhageist"
                   ,Level   = rhageist
)
out_6 = data_frame(Outsider = "K'Ariqua"
                   ,Level   = kariqua
)
out_7 = data_frame(Outsider = "Orphalas"
                   ,Level   = orphalas
)
out_8 = data_frame(Outsider = "Sen-Akhan"
                   ,Level   = sen_akhan
)

results = bind_rows(out_0
                      ,out_1
                      ,out_2
                      ,out_3
                      ,out_4
                      ,out_5
                      ,out_6
                      ,out_7
                      ,out_8
                      )

assign("results", results, envir = .GlobalEnv)
assign("desired_zone", desired_zone, envir = .GlobalEnv)

cat("Debug 3: >>End optimizer.R script<<\n")
