require_dependency Rails.root.join('app', 'models', 'verification', 'residence').to_s

class Verification::Residence
  attr_accessor :address

  def save
    return false unless valid?

    user.update(
      address: address,
      date_of_birth: date_of_birth.to_datetime,
      residence_verified_at: Time.current)
  end

  def document_number_uniqueness
    # no-op
  end

  def call_census_api
    # no-op
  end
end
