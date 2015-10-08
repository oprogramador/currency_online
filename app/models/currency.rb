class Currency < ActiveRecord::Base
  belongs_to :exchange

  def self.median(array)
    array = array.sort
    array.length % 2 === 1 ? array[array.length / 2] : (array[array.length / 2 - 1] + array[array.length / 2]) * 0.5
  end

  def self.get_report(currency_code)
    entities = Currency.where(code: currency_code)
    avg_buy_price = entities.map{|x| x.buy_price}.sum / entities.length
    avg_sell_price = entities.map{|x| x.sell_price}.sum / entities.length
    median_buy_price = self.median entities.map{|x| x.buy_price}
    median_sell_price = self.median entities.map{|x| x.sell_price}
    {
      all: entities,
      avg_buy_price: avg_buy_price,
      avg_sell_price: avg_sell_price,
      median_buy_price: median_buy_price,
      median_sell_price: median_sell_price,
    }
  end
end
