%{
 # include "calc.tab.h"
#include <math.h>
%}

%%
"+" {return PLUS; }
[0-9]+ {  yylval = atoi(yytext); return NUMBER; }
[ \t] ; 
\n {  return EOL; }
. {printf("couldn't match %s", yytext);}
%%
