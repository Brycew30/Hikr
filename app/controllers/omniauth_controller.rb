class OmniauthController < ApplicationController
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      flash[:message] = "You successfully signed in through Google!"
    else
      flash[:message] = "There was a problem signing in through Google. Please register or try signing in later."
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:message] = "There was a problem signing you in. Please register or try signing in later."
    redirect_to new_user_registration_url
  end
end
