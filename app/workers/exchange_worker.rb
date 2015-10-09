class ExchangeWorker
  include Sidekiq::Worker

  def perform
    Exchange.save_current_rates
    UserMailer.info_to_all_users_about_new_exchange 
    open('log/exchange_worker.txt', 'a') { |f| f.puts "#{Time.now}\n" }
  end
end

ExchangeWorker.perform_in 1.day
