require 'open-uri'
require 'nokogiri'

class Exchange < ActiveRecord::Base
  has_many :currencies
  def self.get_nbp_xml
    xml = Nokogiri::HTML open('http://www.nbp.pl/kursy/xml/LastC.xml')
    xml.xpath '//tabela_kursow//pozycja'
  end

  def self.save_current_rates
    xml = get_nbp_xml
    exchange = Exchange.new :name => 'exchange '+Time.now.to_s
    exchange.save
    xml.each do |row|
      currency = Currency.new(
        :name => row.xpath('.//nazwa_waluty').text,
        :buy_price => row.xpath('.//kurs_kupna').text.sub(',', '.').to_f,
        :sell_price => row.xpath('.//kurs_sprzedazy').text.sub(',', '.').to_f,
        :converter => row.xpath('.//przelicznik').text.sub(',', '.').to_f,
        :code => row.xpath('.//kod_waluty').text,
        :exchange => exchange,
      )
      currency.save
    end
  end
end
