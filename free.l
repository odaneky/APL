%{
#include <stdio.h>
#include "free.tab.h"
%}

%%

[0-9]+                  { yylval.number = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]*    { yylval.variable = strdup(yytext); return VARIABLE; }
"+"                     { return ADDITION; }
"-"                     { return SUBTRACTION; }
"*"                     { return MULTIPLICATION; }
"/"                     { return DIVISION; }
"="                     { return ASSIGNMENT; }
";"                     { return SEMICOLON; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
"{"                     { return LBRACE; }
"}"                     { return RBRACE; }
"=="                    { return EQUAL; }
"!="                    { return NOTEQUAL; }
"<"                     { return LESSTHAN; }
">"                     { return GREATERTHAN; }
"<="                    { return LESSEQUAL; }
">="                    { return GREATEREQUAL; }
"&&"                    { return AND; }
"||"                    { return OR; }
"!"                     { return NOT; }

[ \t]                   ; // ignore whitespace
\n                      { yylineno++; } // increment line number
.                       { printf("Invalid character: %s\n", yytext); } // handle invalid characters

%%


