class CalculationsController < ApplicationController
  def instructions
    render("instructions.html.erb")
  end

  def square
    @number = params[:number].to_i
    @number_squared = @number * @number
  end

  def square_root
    @number = params[:number].to_i
    @number_square_root = Math.sqrt(@number)
  end

  def random
    @min = params[:min].to_i
    @max = params[:max].to_i
    @random = rand(@min..@max)
  end

  def payment
    @rate = params[:rate].to_f
    @years = params[:years].to_i
    @principal = params[:principal].to_f
    @calc = (@rate/120000).to_f
    @term = (@years*12)
    @monthly_payment = ((@calc*@principal)*((1+@calc)**@term))/(((1+@calc)**@term)-1)
    @formatted_payment = @monthly_payment.to_f.round(2)
    #(@monthly_payment.to_f).round(2)
  end
end
