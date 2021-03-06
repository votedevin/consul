class Verification::Sms
  include ActiveModel::Model

  attr_accessor :user, :phone, :confirmation_code

  validates :phone, presence: true
  validates :phone, format: { with: /\A[\d \+]+\z/ }
  validate :uniqness_phone

  def uniqness_phone
    errors.add(:phone, :taken) if User.where(confirmed_phone: phone).any?
  end

  def save
    return false unless valid?
    update_user_phone_information
    send_sms
    Lock.increase_tries(user)
  end

  def update_user_phone_information
    user.update(unconfirmed_phone: phone, sms_confirmation_code: generate_confirmation_code)
  end

  def send_sms
    Container['sms_api.send_sms'].call(
      to: user.unconfirmed_phone,
      body: "Your verification code for nyspeaks.org is #{user.sms_confirmation_code}"
    )
  end

  def verified?
    user.sms_confirmation_code == confirmation_code
  end

  private

    def generate_confirmation_code
      rand.to_s[2..5]
    end
end
