%{
#include "free.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t\n]     ;  // skip whitespace
.           { return yytext[0]; } // return all other characters as is
%%

int yywrap(void) {
    return 1;
}
