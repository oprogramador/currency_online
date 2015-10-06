class ExchangeWorker
  include Sidekiq::Worker
  #include Sidetiq::Schedulable

  #recurrence { minutely }

  def perform
    Exchange.save_current_rates
  end
end
