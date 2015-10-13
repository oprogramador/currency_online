class ExchangeWorker
  include Sidekiq::Worker

  def perform
    Exchange.save_current_rates
    open('log/exchange_worker.txt', 'a') { |f| f.puts "#{Time.now}\n" }
  end
end

ExchangeWorker.perform_in 1.day
