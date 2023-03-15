%{
#include "free.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUM; }
[a-zA-Z]+   { yylval = (*yytext - 'a'); return VAR; }
"+"         { return yytext[0]; }
";"         { return yytext[0]; }
[ \t\n]     { /* ignore */ }

%%

int yywrap()
{
    return 1;
}
