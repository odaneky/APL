%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}

%union {int num; char id;}         /* Yacc definitions */
%start line
%token IF
%token LPAREN
 %token RPAREN
%token LBRACE
%token RBRACE
%token ELSE
%token print
%token exit_commandx
%token <num> number
%token <id> identifier
%type <num> line exp term 
%type <id> assignment
%type <id> relop

%%

/* descriptions of expected inputs     corresponding actions (in C) */

line    : assignment ';'		{;}
		| exit_command ';'		{exit(EXIT_SUCCESS);}
        | number '+' number ';' {printf("Printing %d ",$0 + $2);}
		| print exp ';'			{printf("Printing %d\n", $2);}
        | IF LPAREN identifier relop identifier RPAREN LBRACE line RBRACE  // if without the else statement
        | IF LPAREN identifier relop identifier RPAREN LBRACE line RBRACE ELSE LBRACE line RBRACE';' //if with else statement    //if(a == b){ exp }
		| WHILE LPAREN identifier relop identifier RPAREN LBRACE line RBRACE 
        | line assignment ';'	{;}
		| line print exp ';'	{printf("Printing %d\n", $3);}
		| line exit_command ';'	{exit(EXIT_SUCCESS);}
        ;

assignment : identifier '=' exp  { updateSymbolVal($1,$3); };
/* Assign := "id" "=" <exp>
   exp := <term> | <exp> "+" <term>
          <term> | <exp> "-" <term>
          <term> | <exp> "*" <term>
          <term> | <exp> "/" <term>
          "id"
   term:= "num" | "id"
   relop:= "gt"| "lt"| "eq"
   
 */
			
exp    	: term                  {$$ = $1;}
       	| exp '+' term          {$$ = $1 + $3;}
       	| exp '-' term          {$$ = $1 - $3;}
        | exp '*' term          {$$ = $1 * $3;}
        | exp '/' term          {$$ = $1 / $3;}
        | identifier            {$$ = $3;}
       	;
term   	: number                {$$ = $1;}
        | identifier		{$$ = symbolVal($1);} 
        ;
relop   : GT                    {if($2 > $4){$$=1;}else{$$ = 0;}if($$ == 0){printf(" False")}else{printf(" True")};}
        | LT                    {if($2 < $4){$$=1;}else{$$ = 0} if($$ == 0){printf(" False")}else{printf(" True")};}
        | EQ                    {if($2 == $4){$$=1;}else{$$ = 0}if($$ == 0){printf(" False")}else{printf(" True")};}
        ;
%%                     /* C code */

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

/* New code below*/

int yylex() {
    /* lexer code here */
}

int main() {
    /* parser code here */
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
}

%{
if (identifier ) {
    printf("Parsed number is negative: %d\n", $1);
} else {
    printf("Parsed number is positive: %d\n", $1);
}
%}
