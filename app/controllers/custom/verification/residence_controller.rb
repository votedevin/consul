require_dependency Rails.root.join('app', 'controllers', 'verification', 'residence_controller').to_s

class Verification::ResidenceController
  def residence_params
    params
      .require(:residence)
      .permit(:date_of_birth, :postal_code, :terms_of_service, :address)
  end
end
