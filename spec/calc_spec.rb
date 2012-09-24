require File.dirname(__FILE__) + '/spec_helper'

describe "calculator" do
  it "should calculate" do
    Calculator.new.calculate("1 + 2")
  end
end
