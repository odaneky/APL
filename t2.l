%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}
%%
"if"                   {return IF;}
"else"                 {return ELSE;}
"("                    {return LPAREN;}
")"                    {return RPAREN;}
"{"                    {return LBRACE;}
"}"                    {return RBRACE;}
">"                    {return GT;}
"<"                    {return LT;}
"=="                   {return EQ;}
"print"				   {return print;}
"exit"				   {return exit_command;}
[a-zA-Z]			   {yylval.id = yytext[0]; return identifier;}
[0-9]+                 {yylval.num = atoi(yytext); return number;}
[ \t\n]                ;
[-+*/=;]           	   {return yytext[0];}
.                      {ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}
