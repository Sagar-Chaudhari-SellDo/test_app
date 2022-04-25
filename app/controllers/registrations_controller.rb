class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to root_path
      flash[:success] = "Account Created Successfully !"
    else
      render :new
    end
  end

  private

    def set_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
