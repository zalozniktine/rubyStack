class People::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @person = Person.from_omniauth(request.env["omniauth.auth"])

    if @person.persisted?
      sign_in_and_redirect @person, event: :authentication #this will throw if @person is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_person_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
