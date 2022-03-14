class MusicsController < ApplicationController
    
    def index
    end

    def search
        if params[:search].present?
            @searchartists = RSpotify::Artist.search(params[:search])
        end
    end

    def input
        if params[:input].present?
            @searchartist = RSpotify::Artist.search(params[:input]).first
        end
    end
end