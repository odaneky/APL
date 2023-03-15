%{
#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.h"  // header file for the lexer
#include "error.h"   // header file for the error handler
%}

%token IF ELSE WHILE INT FLOAT VOID RETURN
%token PLUS MINUS TIMES DIVIDE EQUALS EQUALITY INEQUALITY LESSTHAN GREATERTHAN LESSTHANEQUAL GREATERTHANEQUAL
%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET COMMA SEMICOLON
%token IDENTIFIER INTEGER FLOATINGPOINT


%left PLUS MINUS
%left TIMES DIVIDE
%nonassoc UMINUS

%%

program         : declaration_list
                ;

declaration_list: declaration_list declaration
                | declaration
                ;

declaration    : var_declaration
                | fun_declaration
                ;

var_declaration: type_specifier IDENTIFIER SEMICOLON
                ;

type_specifier : INT
                | FLOAT
                | VOID
                ;

fun_declaration: type_specifier IDENTIFIER LPAREN params RPAREN compound_stmt
                ;

params          : param_list
                | VOID
                ;

param_list      : param_list COMMA param
                | param
                ;

param           : type_specifier IDENTIFIER
                ;

compound_stmt   : LBRACE local_declarations statement_list RBRACE
                ;

local_declarations: local_declarations var_declaration
                | /* empty */
                ;

statement_list  : statement_list statement
                | /* empty */
                ;

statement       : expression_stmt
                | compound_stmt
                | selection_stmt
                | iteration_stmt
                | return_stmt
                ;

expression_stmt : expression SEMICOLON
                | SEMICOLON
                ;

selection_stmt  : IF LPAREN expression RPAREN statement
                | IF LPAREN expression RPAREN statement ELSE statement
                ;

iteration_stmt  : WHILE LPAREN expression RPAREN statement
                ;

return_stmt     : RETURN SEMICOLON
                | RETURN expression SEMICOLON
                ;

expression      : var EQUALS expression
                | simple_expression
                ;

var             : IDENTIFIER
                | IDENTIFIER LBRACKET expression RBRACKET
                ;

simple_expression: additive_expression relop additive_expression
                | additive_expression
                ;

relop           : LESSTHAN
                | GREATERTHAN
                | LESSTHANEQUAL
                | GREATERTHANEQUAL
                | EQUALITY
                | INEQUALITY
                ;

additive_expression: additive_expression PLUS term
                | additive_expression MINUS term
                | term
                ;

term            : term TIMES factor
                | term DIVIDE factor
                | factor
                ;

factor          : LPAREN expression RPAREN
                | var
                | call
                | INTEGER
                | FLOATINGPOINT
                ;

call            : IDENTIFIER LPAREN args RPAREN
                ;

args            : arg_list
                | /* empty */
                ;

arg_list        : arg_list COMMA expression
                | expression
                ;

%%

int main(void) {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
    exit(1);
}
