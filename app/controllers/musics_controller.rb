class MusicsController < ApplicationController
    
    def index
    end

    def search
        if params[:search].present?
            @searchartists = RSpotify::Artist.search(params[:search])
        end
    end
end