require 'spec_helper'

describe SaveCurrentRates do
  describe "save_current_rates" do
    it "should modify database" do
      last_exchange = Exchange.last
      last_modify = last_exchange ? last_exchange.updated_at : nil
      SaveCurrentRates.new.save_current_rates
      new_last_modify = Exchange.last.updated_at
      expect(last_modify).not_to eql(new_last_modify)
    end
  end
end

