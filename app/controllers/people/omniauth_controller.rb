class People::OmniauthController < ApplicationController
# facebook callback
# def facebook
#     @person = Person.create_from_provider_data(request.env['omniauth.auth'])
#     if @person.persisted?
#       sign_in_and_redirect @person
#       set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
#     else
#       flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
#       redirect_to new_person_registration_url
#     end
#   end
# end

# # google callback
# def google_oauth2
#     @person = Person.create_from_google_data(request.env['omniauth.auth'])
#     if @person.persisted?
#       sign_in_and_redirect @person
#       set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
#     else
#       flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
#       redirect_to new_person_registration_url
#     end
#   end
# end

# def failure
#     flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
#     redirect_to new_person_registration_url
# end

end