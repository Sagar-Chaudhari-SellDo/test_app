class PasswordResetController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user 
      Password.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: "Email is sent. Check your inbox!"
  end

  def edit
  end

  def update
  end
end
