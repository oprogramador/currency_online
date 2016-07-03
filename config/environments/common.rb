Tshtask::Application.configure do
  mailer_address = 'smtp.gmail.com'

  config.action_mailer.smtp_settings = {
    address: mailer_address,
    port: 587,
    domain: mailer_address,
    authentication: 'plain',
    enable_starttls_auto: true,
    user_name: ENV['GMAIL_USERNAME'],
    password: ENV['GMAIL_PASSWORD']
  }

  config.action_mailer.default_url_options = { :host => ENV['DOMAIN_NAME'] }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.asset_host = ENV['DOMAIN_NAME']
  config.action_mailer.relative_url_root = ENV['DOMAIN_NAME']
end

# uncomment the line below if you have redis installed
# SaveCurrentRatesWorker.perform_in 1.second
