class ApplicationController < ActionController::Base
  # ログインしていない場合、top画面に移動する
  before_action :authenticate_user!, except: [:top]

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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
