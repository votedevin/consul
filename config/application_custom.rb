module Consul
  class Application < Rails::Application
    config.action_mailer.default_options = {from: 'no-reply@proposals.votedevin.com'}
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: "localhost",
      port: 25,
      openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
    }

    config.force_ssl = false
    config.action_mailer.asset_host = "http://#{Rails.application.secrets.server_name}"
    config.i18n.default_locale = :en
    config.time_zone = 'America/New_York'
  end
end
