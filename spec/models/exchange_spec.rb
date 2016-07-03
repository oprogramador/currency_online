require 'spec_helper'

describe Exchange do
  it "should set this to all related currencies" do
    exchange = Exchange.create!
    Currency.new({exchange: exchange}).save!
    exchange.currencies.each do |currency|
      expect(currency.exchange).to eql(exchange)
    end
  end
end
