class SaveCurrentRatesWorker
  include Sidekiq::Worker

  def perform
    SaveCurrentRates.new.save_current_rates
    open('log/save_current_rates_worker.txt', 'a') { |f| f.puts "#{Time.now}\n" }
    SaveCurrentRatesWorker.perform_in 1.second
  end
end
