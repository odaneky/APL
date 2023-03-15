%{
#include <stdio.h>
void yyerror(const char *);
%}

%token NUMBER

%%

program:
    statement    { printf("Result: %d\n", $1); }
    ;

statement:
    expression  { $$ = $1; }
    ;

expression:
    NUMBER '+' NUMBER  { $$ = $1 + $3; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

