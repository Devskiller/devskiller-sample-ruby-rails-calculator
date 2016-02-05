require 'test_helper'

class CalculatorControllerTest < ActionController::TestCase

  test "should add" do
    get :index
    post :calculate, {x: 10, y: 12, operation: 'add'}
    assert_response :success
    assert_select "#calculator-result", {text: '22'}
  end
  test "should subtract" do
    get :index
    post :calculate, {x: 10, y: 12, operation: 'subtract'}
    assert_response :success
    assert_select "#calculator-result", {text: '-2'}
  end
  test "should multiply" do
    get :index
    post :calculate, {x: 10, y: 12, operation: 'multiply'}
    assert_response :success
    assert_select "#calculator-result", {text: '120'}
  end
  test "should divide" do
    get :index
    post :calculate, {x: 10, y: 2, operation: 'divide'}
    assert_response :success
    assert_select "#calculator-result", {text: '5'}
  end

end
