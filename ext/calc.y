%{
#include <stdio.h>
#include <stdlib.h>
#include "ruby.h"
%}

%token NUMBER
%token PLUS
%token EOL

%%

calc: NUMBER PLUS NUMBER EOL {  $$ =  $1 + $3;}
;
%%


yyerror(char *s)
{
fprintf(stderr, "error: %s\n", s);
}

static VALUE t_calculate(VALUE self, VALUE anObject){
  char tstr[] = " 5 + 2 \n\0";
  yy_scan_buffer(tstr, sizeof(tstr));
   int result = yyparse();
   printf("result : ---- %d" , result);
  return rb_str_new2("result");
}
void Init_calc(){
 VALUE  cCalc = rb_define_class("Calculator", rb_cObject);
  rb_define_method(cCalc , "calculate", t_calculate, 1);
}
