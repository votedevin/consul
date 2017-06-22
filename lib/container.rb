class Container
  extend Dry::Container::Mixin

  namespace('sms_api') do
    register('client') do
      Twilio::REST::Client.new(
        Rails.application.secrets.sms_account_sid,
        Rails.application.secrets.sms_auth_token
      )
    end

    register('send_sms') do |params|
      params[:from] = Rails.application.secrets.sms_from

      self['sms_api.client'].account.messages.create(params)
    end
  end
end
