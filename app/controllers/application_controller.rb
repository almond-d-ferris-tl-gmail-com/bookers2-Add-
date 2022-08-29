class ApplicationController < ActionController::Base
 # ログイン後の遷移先を変更
    before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    books_path
  end

  def after_Log_in_path_for(resource)
    books_path
  end

  def after_sign_out_path_for(resource)
    top_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:Log_in, keys: [:email])
  end

end
