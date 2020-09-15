class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  def home
    require_login
  end

  def welcome
    redirect_to home_path if user_signed_in?
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You need to be logged in to see this section."
      redirect_to root_path
    end
  end
    protected
    def configure_permitted_parameters
      added_attrs = %i[username email password password_confirmation remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
