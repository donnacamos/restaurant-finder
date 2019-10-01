class SessionsController < ApplicationController
     

    def index 

    end 

    def new 
        @user = User.new 
    end 

    def create

        if params[:provider] == 'google_oauth2'
          @user = User.create_by_google_omniauth(auth)
          session[:user_id] = @user.id
          redirect_to user_path(@user)
    
        
        else
    
          #Try to find the user in the system
          @user = User.find_by(username: params[:user][:username])
          #did we find someone & did they put in the right password?
          #if @user && @user.authenticate(params[:user][:password])
    
          if @user && @user.authenticate(password: params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            flash[:error] = "Sorry, login info was incorrect. Please try again."
            redirect_to login_path
          end
        end
      end
   
     def home 
    end 

    def destroy 
      session.clear 
      redirect_to '/'
    end 

    def omniauth
        @user = User.create_by_google_omniauth(auth)
    
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    
      private
    
        def auth
          request.env['omniauth.auth']
        end
    end
