base_hs = function(lvl,tp,ponyboy,prec){
  
  if(lvl == 100) return(mpfr(1,prec))
  
  ret =  floor(
    ( (mpfr(lvl,prec) - 80) / 25 )^1.3
  ) * 
    (1 + mpfr(ponyboy,prec) / 100)
  
  
  return(mpfr(ret,prec)[1])
  
}