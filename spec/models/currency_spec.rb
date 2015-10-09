require 'spec_helper'

describe Currency do
  describe "median" do
    it "should be middle value with odd number of elements" do
      expect(Currency.median [8, 30, 2]).to eql 8
    end

    it "should be average of two middle values with even number of elements" do
      expect(Currency.median [4, 11, 30, 3]).to eql 7.5
    end
  end

  describe "get_report" do
    it "should return all needed keys" do
      Currency.new({code: 'AUD', buy_price: 2, sell_price: 2.5, name: 'AUD', converter: 1}).save!
      report = Currency.get_report 'AUD'
      expect(report[:currency]).not_to be_nil
      expect(report[:all]).not_to be_nil
      expect(report[:avg_buy_price]).not_to be_nil
      expect(report[:avg_sell_price]).not_to be_nil
      expect(report[:median_buy_price]).not_to be_nil
      expect(report[:median_sell_price]).not_to be_nil
    end
  end
end
