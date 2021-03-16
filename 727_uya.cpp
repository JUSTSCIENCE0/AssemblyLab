#include <stdio.h>
int main()
{
   int numbers[12];
   for (int i=0; i<12; i++)
   {
       scanf("%d", &numbers[i]);
   }
   printf("Success!\n");
   int summ = 0;
   for (int i=0; i<12; i++)
   {
       if (numbers[i]<0)
           numbers[i] *= -1;
       printf("%d\n", numbers[i]);
       summ += numbers[i];
   }
   printf("Success!\n");
   printf("%d\n", summ);
   printf("Success!\n");
   return 0;
}
