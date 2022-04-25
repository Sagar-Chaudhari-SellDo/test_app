class SessionsController < ApplicationController  
  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    # debugger
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id.to_s
      redirect_to root_path, notice: "logged in"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
    # render plain: "test #{ User.find_by(email: params[:user][:email]) }"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path,  alert: "logged out"
  end

  # private

  #   def set_user
  #     @user = User.find_by(email: params[:email])
  #   end

  #   def set_params
  #     params.require(:user).permit(:email, :password)
  #   end
end
