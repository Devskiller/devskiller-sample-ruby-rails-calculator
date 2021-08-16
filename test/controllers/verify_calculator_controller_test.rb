require 'test_helper'

class VerifyCalculatorControllerTest < ActionController::TestCase
  def setup
    @controller = CalculatorController.new
  end

  test 'should add' do
    post :calculate, params: { x: 100, y: 12, operation: '+' }

    assert_response :success
    assert_select '#calculator-result', { text: '112' }
  end

  test 'should subtract' do
    post :calculate, params: { x: 100, y: 12, operation: '-' }

    assert_response :success
    assert_select '#calculator-result', { text: '88' }
  end

  test 'should multiply by zero' do
    post :calculate, params: { x: 10, y: 0, operation: '*' }

    assert_response :success
    assert_select '#calculator-result', { text: '0' }
  end

  test 'should divide by zero' do
    post :calculate, params: { x: 10, y: 0, operation: '/' }

    assert_response :success
    assert_select '#calculator-result', { text: 'ERROR' }
  end
end
