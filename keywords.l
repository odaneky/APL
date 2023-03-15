%{
#include <stdio.h>
%}

%%
if              { printf("IF\n"); }
else            { printf("ELSE\n"); }
while           { printf("WHILE\n"); }
int             { printf("INT\n"); }
float           { printf("FLOAT\n"); }
void            { printf("VOID\n"); }
for             {printf("FOR\n");}
"+"             { printf("PLUS\n"); }
"-"             { printf("MINUS\n"); }
"*"             { printf("TIMES\n"); }
"/"             { printf("DIVIDE\n"); }
"="             { printf("EQUALS\n"); }
"=="            { printf("EQUALITY\n"); }
"!="            { printf("INEQUALITY\n"); }
"<"             { printf("LESSTHAN\n"); }
">"             { printf("GREATERTHAN\n"); }
"<="            { printf("LESSTHANEQUAL\n"); }
">="            { printf("GREATERTHANEQUAL\n"); }

"("             { printf("LPAREN\n"); }
")"             { printf("RPAREN\n"); }
"{"             { printf("LBRACE\n"); }
"}"             { printf("RBRACE\n"); }
"["             { printf("LBRACKET\n"); }
"]"             { printf("RBRACKET\n"); }
","             { printf("COMMA\n"); }
";"             { printf("SEMICOLON\n"); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER\n"); }
[0-9]+          { printf("INTEGER\n"); }
[0-9]+\.[0-9]+  { printf("FLOATINGPOINT\n"); }

[ \t\n]         { /* Ignore whitespace */ }
.               { printf("UNKNOWN\n"); }

%%

int main(void)
{
    yylex();
    return 0;
}
