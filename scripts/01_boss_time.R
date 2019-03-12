# 1. Chronos / Orphalas
boss_time = function(lvl,orph_lvl,chr_lvl){
  ###   Declare function boss_time ###
  #cat("Parameters (boss_time): lvl:",lvl,", orph_lvl:",orph_lvl,", chr_lvl",chr_lvl,"\n")
  
  scaled       = lvl %/% 500
  
  base_time    = 30
  
  orph_gain    = 75 * orph_lvl
  
  chronos_gain = base_time * ( 1 - exp( -0.034 * chr_lvl ) )
  
  zone_loss    = -2 * scaled
  
  eff_time     = max( base_time + chronos_gain * ( 1 + orph_gain / 100 ) + zone_loss , 2 )
  
  return(eff_time)
  
  ###   End function boss_time   ###
}