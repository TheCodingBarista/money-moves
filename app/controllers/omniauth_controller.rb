class OmniauthController < ApplicationController
    def twitter
        @user = User.create_from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
          sign_in_and_redirect @user
        else
          flash[:error] = "There was a problem signing you in through Twitter. Please register or try signing in later."
          redirect_to new_user_registration_url
        end
    end

    def spotify
      @user = User.create_from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in_and_redirect @user
      else
        flash[:error] = "There was a problem signing you in through Twitter. Please register or try signing in later."
        redirect_to new_user_registration_url
      end
    end

    def failure
        redirect_to root_path
    end
end
