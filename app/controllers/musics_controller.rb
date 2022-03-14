class MusicsController < ApplicationController
    
    def index
    end

    def search
        if params[:search].present?
            @searchartists = RSpotify::Artist.search(params[:search])
            #@searchartist = RSpotify::Artist.search(params[:search]).first
        end
    end
end