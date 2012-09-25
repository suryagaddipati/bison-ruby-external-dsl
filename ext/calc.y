%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%token PLUS
%token EOL

%%

calc: NUMBER PLUS NUMBER EOL { printf("result: %d", $1 + $3);}
;
%%

main(int argc, char **argv)
{
  char tstr[] = " 5 + 2 \n\0";
  yy_scan_buffer(tstr, sizeof(tstr));
  yyparse();
}

yyerror(char *s)
{
fprintf(stderr, "error: %s\n", s);
}
