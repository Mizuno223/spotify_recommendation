class ApplicationController < ActionController::Base
    require 'rspotify'
    RSpotify.authenticate(ENV['Client_ID'], ENV['Client_Secret'])
    ENV['ACCEPT_LANGUAGE'] = "ja"
end
