class MusicsController < ApplicationController

    def search
        if params[:search].present?
            @searchartists = RSpotify::Artist.search(params[:search])
        end
    end

    def input
        if (params[:input1].present?) && (params[:input2].present?) && (params[:input3].present?)
            @searchartist1 = RSpotify::Artist.search(params[:input1]).first
            @searchartist2 = RSpotify::Artist.search(params[:input2]).first
            @searchartist3 = RSpotify::Artist.search(params[:input3]).first

            #重複してるジャンルを取り出す
            duplicateGenre = [@searchartist1.genres, @searchartist2.genres, @searchartist3.genres].inject(&:&)
            
            #重複していないジャンルランダムに取り出す
            genres = [@searchartist1.genres, @searchartist2.genres, @searchartist3.genres].flatten!
            counts = Hash.new(0)
            genres.each { |v| counts[v] += 1 }
            uniqueGenre = counts.select { |v, count| count == 1 }.keys

            #重複してるジャンルを優先して5つのジャンルを指定する
            @genres = duplicateGenre.push(uniqueGenre.sample(5 - duplicateGenre.length)).flatten!
            recommendations = RSpotify::Recommendations.generate(seed_genres: @genres)
            
            @recommendations = recommendations.tracks.map {|track| [track.artists.first.name, track.name].join('/')}
            # @artist = @recommendations.tracks.map {|track| [track.artists.first.name].join('/')}
        else
            @message = '入力してください'
        end
    end
end