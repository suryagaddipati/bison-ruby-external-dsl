#include "ruby.h"
static VALUE t_calculate(VALUE self, VALUE anObject){
  return rb_str_new2("result");
}
void Init_calc(){
 VALUE  cCalc = rb_define_class("Calculator", rb_cObject);
  rb_define_method(cCalc , "calculate", t_calculate, 1);
}
