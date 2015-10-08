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
    #generate a report for selected currency
    #report should show: basic statistics: mean, median, average
    #also You can generate a simple chart(use can use some js library)

    #this method should be available only for currencies which exist in the database 
  end


end
