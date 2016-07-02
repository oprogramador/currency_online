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
end
