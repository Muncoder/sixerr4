class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
		@user = User.from_facebook(request.env['omniauth.auth'])

		if @user.persisted?
			sign_in_and_redirect @user, :event => 'auathentication'
			set_flash_message(:notice, :success, :kind => 'facebook') if is_navigational_format?
		else
			session["devise.facebook_data"] = request.env["omniauth.auth"]
			redirect_to_new_user_registration_url
		end
	end

end