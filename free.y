%{
#include <iostream>
#include "free.tab.h"
using namespace std;
%}

%token NUMBER

%%
expression: NUMBER '+' NUMBER  { cout << $1 + $3 << endl; }
          | NUMBER '-' NUMBER  { cout << $1 - $3 << endl; }
          | NUMBER '*' NUMBER  { cout << $1 * $3 << endl; }
          | NUMBER '/' NUMBER  { 
                                  if($3 != 0)
                                    cout << $1 / $3 << endl;
                                  else
                                    cerr << "Error: Division by zero" << endl;
                                }
          ;

%%

void yyerror(char *s) {
    cerr << "Error: " << s << endl;
}

int main() {
    yyparse();
    return 0;
}
