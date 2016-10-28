#include <math.h>

float mysqrt (float x)
{
    if (x <= 0){
      return 0;
    }
  // if we have both log and exp then use them
#if defined (HAVE_LOG) && defined (HAVE_EXP)

  int i=0;
  for (; i <= x; i++){
    if (i*i == x){
      return i;
    }
  }
  return 0;
#else // otherwise use an iterative approach
    return exp(log(x)*0.5);
#endif

}
