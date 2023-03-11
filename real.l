%{
#include <stdio.h>
%}

%%
[-]+[0-9]+               printf("Negative number");
[0-9]+                   printf("Number");
[a-zA-Z][a-zA-Z0-9]*    printf("Word");
%%