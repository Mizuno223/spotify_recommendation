class MusicsController < ApplicationController
    
    def index
    end

    def search
        if params[:search1].present?
            @searchartists = RSpotify::Artist.search(params[:search])
        end
    end

    def input
        if (params[:input1].present?) && (params[:input2].present?) && (params[:input3].present?)
            searchartist1 = RSpotify::Artist.search(params[:input1]).first
            searchartist2 = RSpotify::Artist.search(params[:input2]).first
            searchartist3 = RSpotify::Artist.search(params[:input3]).first
            genres = [searchartist1.genres, searchartist2.genres, searchartist3.genres]
            genres = genres.flatten!
            @genres = genres.sample(5)
            @recommendations = RSpotify::Recommendations.generate(seed_genres: @genres)
        end
    end
end