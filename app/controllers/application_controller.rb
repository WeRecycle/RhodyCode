class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_login
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :avatar, :description])
          devise_parameter_sanitizer.permit(:account_update, keys:[:email, :avatar, :description])
      end

    private
      def ensure_login
        redirect_to "/landingpage" unless user_signed_in?
      end
end
