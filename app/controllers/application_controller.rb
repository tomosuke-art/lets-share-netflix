class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        user_path(resource.id)
    end

    

    protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :user_name, :password, :password_confirmation, :image_name, :introduce ]
    devise_parameter_sanitizer.permit :sign_up, keys: [:image_name,:user_name,:introduce]
    devise_parameter_sanitizer.permit :account_update, keys: [:image_name,:user_name,:introduce]
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  
end
