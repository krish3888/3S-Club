class PasswordResetsController < ApplicationController
  def new
  end

  def create
    
  	user = User.find_by_email(params[:email])
  	if user
 	  user.send_password_reset
  	UserMailer.password_reset(user).deliver
  	redirect_to root_url, :notice=> "Please check your email for a reset password link with password reset instructions."
  	else
  	redirect_to root_url, :notice=> "This email doesn't belongs to 3S-Clube.Please check your email."
 	  end	
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, :alert => "Password reset has expired."
  elsif @user.update_attributes(user_params)
    redirect_to root_url, :notice => "Password has been reset!"
  else
    render :edit
  end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
