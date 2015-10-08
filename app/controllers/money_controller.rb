class MoneyController < ApplicationController

  def index
  end

  def show
  end

  def refresh_rates
    Exchange.save_current_rates
    redirect_to action: 'index'
  end

  def report
    @report = Currency.get_report params[:code]
  end

  def all_currencies
    @currencies = Currency.select(:code, :name).group(:code, :name)
  end

end
