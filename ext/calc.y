%{
#include <stdio.h>
#include <stdlib.h>
#include "ruby.h"
int ret_value ;
%}

%token NUMBER
%token PLUS
%token EOL

%%

calc: NUMBER PLUS NUMBER{  ret_value =  $1 + $3;}
;
%%


yyerror(char *s)
{
fprintf(stderr, "error: %s\n", s);
}

static VALUE t_calculate(VALUE self, VALUE rstr){
  char* tstr=  RSTRING_PTR(rstr); 
  yy_scan_buffer(tstr, sizeof(tstr));
   yyparse();
  return  INT2NUM(ret_value);
}
void Init_calc(){
 VALUE  cCalc = rb_define_class("Calculator", rb_cObject);
  rb_define_method(cCalc , "calculate", t_calculate, 1);
}
