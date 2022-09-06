class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 # ログイン後の遷移先を変更
    before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
    #books_path
  end

  def after_sign_out_path_for(resource)
    top_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #   added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
#    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
 #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
