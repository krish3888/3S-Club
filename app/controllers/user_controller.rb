class UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
	end	

    def list
    @users = User.all
    end

	def new
		
	end

    def show
    @user = User.find(params[:id])
    end

 	def sign_up
	end

	def create

        #captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
    #@user = User.new(user_params)
    #if !verify_recaptcha(model: @user, message: captcha_message) || !@user.save
     # render "new"
    #end

   # @user = User.new(user_params)
    #if verify_recaptcha(model: @user) && @user.save
    #redirect_to '/login'
     #else
     #   render 'sign_up'
      
#@user = User.new(user_params)
 #recaptcha_valid = verify_recaptcha(model: @user)
 
#if recaptcha_valid

 #if @user.save
  #redirect_to '/login'
#else
 #render 'sign_up'
#end
#else
    # Score is below threshold, so user may be a bot. Show a challenge, require multi-factor
    # authentication, or do something else.
 #render 'sign_up'
  #end




		@user = User.new(user_params)
        if @user.save
           flash[:success] ="User was Sucessfully created"
            #flash[:success] = "Hey #{@user.username}, welcome"
        redirect_to '/login'
        else
          render 'sign_up'
        end
	end

	def user_params
      #params[:user]=params
      params.permit(:email, :password, :password_confirmation)
    end
    
end