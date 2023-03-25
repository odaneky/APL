%{
#include "y.tab.h"
extern void yyerror(const char *s);
%}

%%

[ \t]+                  /* ignore whitespace */
[0-9]+                  { yylval.num = atoi(yytext); return NUMBER; }
[A-Za-z][A-Za-z0-9_]*   { strcpy(yylval.id, yytext); return ID; }
[\+\-\*/]               { return yytext[0]; }
"if"                    { return IF; }
"else"                  { return ELSE; }
"=="                    { return EQ; }
">="                    { return GE; }
"<="                    { return LE; }
"!="                    { return NE; }
">"                     { return GT; }
"<"                     { return LT; }
"="                     { return ASSIGN; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }

%%

