class HomeController < ApplicationController
  def index
  end

  def exchange
    value = ExchangeService.new(params[:currency], params[:currency_destination], params[:quantity]).perform
    render json: {"value": value}
  end
end