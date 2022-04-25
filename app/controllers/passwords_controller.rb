class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    # debugger
    if @current_user.update_attributes(password_params)
      redirect_to root_path, notice: "Password updated successfully!"
    else
      render :edit
    end
  end

  private 
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
