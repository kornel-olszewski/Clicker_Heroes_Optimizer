# 5. Dora / Sen-Akhan
chest_chance = function(lvl,sen_akhan_lvl,dora_lvl){
  ###   Declare function chest_chance   ###
  #cat("Parameters (chest_chance): lvl:",lvl,", sen_akhan_lvl:",sen_akhan_lvl,", dora_lvl:",dora_lvl,"\n")
  
  scaled = lvl %/% 500
  
  chest_ch = ( 10^-10 + 
                 ( 10^-2 - 10^-10 ) * 
                 exp( -0.006 * scaled ) 
  ) * ( 
    1 + 99 * ( 1 - exp( -0.002 * dora_lvl ) ) * ( 1 + sen_akhan_lvl ) 
  )
  
  return(chest_ch)
  
  ###   End function chest_chance   ###
}