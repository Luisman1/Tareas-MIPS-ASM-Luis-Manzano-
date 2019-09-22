/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
#include <stdlib.h>

int potencia (int N);

int
main ()
{
  int n, resultado;

  printf ("Introduzca su n: ");
  scanf ("%d", &n);

  resultado = potencia (n);

  printf ("Resultado de 2^%d: %d", n, resultado);

  return 0;
}

int
potencia (int N)
{
  int result;
  int n = N;

  if (n == 0)			// Condicion base
    result = 1;
  else				// Condiciones para n > 0
    {
      result = potencia (n - 1);
      result *= 2;
    }

  return result;
}
