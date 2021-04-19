class SongsController < ApplicationController

    
    get '/songs' do
        if logged_in?
            @songs = Song.all
            erb :"songs/index"
        else 
            redirect "/login"
        end
    end 

    get '/songs/alternative' do 
        @songs = Song.all
        erb :"songs/alternative"
    end 

    get '/songs/pop' do 
        @songs = Song.all
        erb :"songs/pop"
    end 

    get '/songs/rnb' do 
        @songs = Song.all
        erb :"songs/rnb"
    end 

    get '/songs/edm' do 
        @songs = Song.all
        erb :"songs/edm"
    end 

    get '/songs/rap' do 
        @songs = Song.all
        erb :"songs/rap"
    end 

    get '/songs/new' do 
        if logged_in?
            @songs = Song.all
            erb :"songs/new"
        else 
            redirect "/login"
        end 
    end 

    get '/songs/:id' do 
        if logged_in?
            
            @song = Song.find_by_id(params[:id])
            @creator = User.find_by_id(@song.user_id)
            erb :"songs/show"
        else 
            redirect "/login"
        end 
    end 

    get '/songs/:id/edit' do 
        if logged_in?
            @song = Song.find_by_id(params[:id])
            if @song.user_id != current_user.id || @song.user_id == nil 
                redirect "/songs"
            else 
                erb :"songs/edit"
            end 
        else 
            redirect "/login"
        end
    end 

    post '/songs' do 
        song = current_user.songs.build(params)
    
        if song.save
            redirect "/songs/#{song.id}"
        else 
            redirect "/songs/new"
        end 
    end 

    patch '/songs/:id' do 
        @song = Song.find_by_id(params[:id])
            params.delete("_method")
        @song.update(params)
     
        if @song.update(params) 
            redirect "/songs/#{@song.id}"
        else
            redirect "songs/:id/edit"
        end
    end 

    delete "/songs/:id" do
        @song = Song.find_by_id(params[:id])
        @song.destroy
        redirect "/songs"
    end

    
end 