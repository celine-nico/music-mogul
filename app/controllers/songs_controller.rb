class SongsController < ApplicationController

    
    get '/songs' do
        @songs = Song.all
        erb :"songs/index"
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
        @songs = Song.all
        erb :"songs/new"
    end 

    get '/songs/:id' do 
        # @songs = Song.all
        @song = Song.find_by_id(params[:id])
        erb :"songs/show"
    end 

    get '/songs/:id/edit' do 
        @song = Song.find_by_id(params[:id])
        erb :"songs/edit"
    end 

    post '/songs' do 
        song = current_user.songs.build(params)
    
        if song.save
            binding.pry
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