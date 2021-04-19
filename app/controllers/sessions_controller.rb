class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        # checks to see if user exists  
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            # redirects to index
            redirect "/songs"
        # if they don't, then redirect to login
        else
            redirect "/login"
        end
    end

    get '/signup' do
        erb :"sessions/signup"
    end 
    
    post '/signup' do
        @user = User.new(params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect "/songs"
        else
            erb :"sessions/signup"
        end
    end 

    get '/logout' do
        session.clear
        redirect "/"
    end


end 