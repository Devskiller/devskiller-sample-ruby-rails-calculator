require 'test_helper'


class VerifyCalculatorControllerTest < ActionController::TestCase

  def setup
    @controller = CalculatorController.new
  end

  test "should add" do
    get :index
    post :calculate, params: {x: 100, y: 12, operation: 'add'}
    assert_response :success
    assert_select "#calculator-result", {text: '112'}
  end

  test "should subtract" do
    get :index
    post :calculate, params: {x: 100, y: 12, operation: 'subtract'}
    assert_response :success
    assert_select "#calculator-result", {text: '88'}
  end

  test "should multiply by zero" do
    get :index
    post :calculate, params: {x: 10, y: 0, operation: 'multiply'}
    assert_response :success
    assert_select "#calculator-result", {text: '0'}
  end

  test "should divide by zero" do
    get :index
    post :calculate, params: {x: 10, y: 0, operation: 'divide'}
    assert_response :success
    assert_select "#calculator-result", {text: 'ERROR'}
  end

end
