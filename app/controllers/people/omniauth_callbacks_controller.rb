# app/controllers/users/omniauth_callbacks_controller.rb:


class People::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @person = Person.from_omniauth(request.env['omniauth.auth'])

      if @person.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @person, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
        redirect_to new_person_registration_url, alert: @person.errors.full_messages.join("\n")
      end
  end
  
end