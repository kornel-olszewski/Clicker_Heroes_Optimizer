tr_hs = function(lvl,tp,ponyboy,prec){
  
  if(lvl == 100) return(mpfr(0, prec))
  
  ret = 20 * ( 1 + 10 * (mpfr(ponyboy,prec) ^ 2) ) * ( 1 + mpfr(tp,prec) / 100 ) ^
    ( mpfr(lvl,prec) / 5 - 20 )
  
  return(mpfr(ret,prec)[1])
  
}