class SessionsController < ApplicationController
     

    def home
    end 

    def destroy 
      session.delete(:user_id)  
      redirect_to '/'
    end 

    def new  
    end 

    def create

      if params[:provider] == 'google_oauth2'
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)

      else 

        @user = User.find_by(username: params[:user][:username])
  
        if @user && @user.authenticate(password: params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user.id)
        else
          flash[:error] = "Sorry, login info was incorrect. Please try again."
          redirect_to login_path
        end
      end 
    end


    def omniauth
      @user = User.create_by_google_omniauth(auth)
      @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end 

    private

    def auth
      request.env['omniauth.auth']
    end
   
    end
