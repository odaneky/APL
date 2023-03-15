%{
#include <stdio.h>
#include "free.tab.h"
int yylex(void);
void yyerror(const char *msg) { fprintf(stderr, "Error: %s\n", msg); }
%}

%token NUM
%token VAR

%%
program : expr ';' { printf("%d\n", $1); }
        ;
expr    : NUM           { $$ = $1; }
        | VAR           { $$ = $1; }
        | expr '+' expr { $$ = $1 + $3; }
        ;
%%

int main()
{
    yyparse();
    return 0;
}
