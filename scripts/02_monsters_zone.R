monsters_zone = function(lvl,borb_lvl,kuma_lvl){
  ###   Declare function monsters_zone   ###
  #cat("Parameters (monsters_zone): lvl:",lvl,", borb_lvl:",borb_lvl,", kuma_lvl",kuma_lvl,"\n")
  
  scaled        = lvl %/% 500
  
  base_monsters = 10
  
  borb_gain     = 12.5 * borb_lvl
  
  kuma_gain     = 8 * ( 1 - exp( -0.01 * kuma_lvl ) )
  
  monsters_gain = scaled  * 0.1
  
  eff_monsters  = max( base_monsters + monsters_gain - kuma_gain * ( 1 + borb_gain / 100 ), 2 )
  
  return(eff_monsters)
  
  ###   End function monsters_zone   ###
}