class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        #finds the user by their username
        user = User.find_by(username: params[:username])
        # checks to see if user exists and password is correct 
        if user && user.authenticate(params[:password])
            # puts user into sessions
            session[:user_id] = user.id
            # redirect them somewhere
            redirect "/songs"
        # if they don't, then redirect them somewhere else
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