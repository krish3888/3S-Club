class SessionsController < ApplicationController
  def index

  end

  def home
    
  end

  def new
    
  end

  def create
    	
  	user = User.find_by_email(params[:session][:email])

       if user && user.authenticate(params[:session][:password])
        session[:user_id]= user.id
        #flash[:success] = "Login successful"
        redirect_to '/dashboard' , notice: "Logged in"
       else
        flash.now[:alert] = "Username or Password incorrect"
        redirect_to '/login_user'
       end
  end

  def destroy
  	session[:user_id]= nil
        #flash[:success] = "Logged out"
        redirect_to 'login' , notice: "Logged in"
  end
end
