# 3. Atman / Rhageist
primals = function(lvl,rhag_lvl,atman_lvl){
  ###   Declare function primals   ###
  #cat("Parameters (primmals): lvl:",lvl,", rhag_lvl:",rhag_lvl,", atman_lvl",atman_lvl,"\n")
  
  scaled       = lvl %/% 500
  
  base_prichnc = 0.25
  
  rhag_gain    = 25 * rhag_lvl
  
  atman_gain   = 0.75 * ( 1 - exp( -0.013 * atman_lvl ) )
  
  prichnc_loss = -0.02  * scaled
  
  eff_prichnc  = max( base_prichnc + prichnc_loss + atman_gain * ( 1 + rhag_gain / 100 ) , 0.05 )
  
  return(eff_prichnc)
  
  ###   End function primals   ###
}