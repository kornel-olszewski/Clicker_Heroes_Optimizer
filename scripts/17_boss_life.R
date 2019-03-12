# 4. Bubos / K'Ariqua
boss_life = function(lvl,kariqua_lvl,bubos_lvl){
  ###   Declare function boss_life   ###
  
  scaled       = lvl %/% 500
  
  base_boss    = 10
  
  kariqua_gain = 50 * kariqua_lvl
  
  bubos_loss   = 5 * ( 1 - exp( -0.02 * bubos_lvl ) )
  
  boss_hp_gain = 0.4 * scaled
  
  boss_hp      = max( base_boss + boss_hp_gain - bubos_loss * ( 1 + kariqua_gain / 100 ) , 5 ) %>% floor()
  
  return(boss_hp)
  
  ###   End function boss_life   ###
}