require 'test_helper'

class CalculatorControllerTest < ActionController::TestCase
  test 'should add' do
    post :calculate, params: { x: 10, y: 12, operation: '+' }
    
    assert_response :success
    assert_select '#calculator-result', { text: '22' }
  end

  test 'should subtract' do
    post :calculate, params: { x: 10, y: 12, operation: '-' }

    assert_response :success
    assert_select '#calculator-result', { text: '-2' }
  end

  test 'should multiply' do
    post :calculate, params: { x: 10, y: 12, operation: '*' }

    assert_response :success
    assert_select '#calculator-result', { text: '120' }
  end

  test 'should divide' do
    post :calculate, params: { x: 10, y: 2, operation: '/' }

    assert_response :success
    assert_select '#calculator-result', { text: '5' }
  end
end
