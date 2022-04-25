class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user
  
  def set_current_user
    # debugger
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])  
    end
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "You must be logged in" if @current_user.nil?
  end

  
end

