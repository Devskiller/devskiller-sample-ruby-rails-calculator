class CalculatorController < ApplicationController
  def calculate
    @x = params[:x].to_i
    @y = params[:y].to_i
    @operation = params[:operation]
    @result = 'ERROR'

    render 'index'
  end
end
