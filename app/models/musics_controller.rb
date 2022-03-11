class MusicsController < ApplicationController
    
    def index
    end

    def search

    end

    def show
        @artist = RSpotify::Artist.search('いきものがかり').first
    end
end