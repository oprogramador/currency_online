require 'spec_helper'

describe Exchange do
  it "should set this to all related currencies" do
    exchange = Exchange.create!
    Currency.new({exchange: exchange}).save!
    exchange.currencies.each do |currency|
      expect(currency.exchange).to eql(exchange)
    end
  end

  describe "save_current_rates" do
    it "should modify database" do
      last_modify = Exchange.last.updated_at
      Exchange.save_current_rates
      new_last_modify = Exchange.last.updated_at
      expect(last_modify).not_to eql(new_last_modify)
    end
  end
end
