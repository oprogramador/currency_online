require 'open-uri'

class SaveCurrentRates
  private
  def get_nbp_xml
    xml = Nokogiri::HTML open('http://www.nbp.pl/kursy/xml/LastC.xml')
    xml.xpath '//tabela_kursow//pozycja'
  end

  public
  def save_current_rates
    xml = get_nbp_xml
    exchange = Exchange.where('created_at::timestamp::date = ?', Time.now.strftime('%Y-%m-%d')).first
    if exchange === nil
      exchange = Exchange.new :name => 'exchange '+Time.now.to_s
    else
      exchange.currencies.each do |currency|
        currency.destroy
      end
    end
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
    UserMailer.info_to_all_users_about_new_exchange 
  end
end

