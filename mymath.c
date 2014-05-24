#include "mymath.h"
#include <stdio.h>

int const dummy_to_make_this_compressible[10000] = {1,2,3};

void my_init()
{
  fprintf(stderr, "mymath my_init hogehogehoge\n");
}

int my_sum(int n1, int n2)
{
  return n1+n2;
}

