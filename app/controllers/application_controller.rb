class ApplicationController < ActionController::Base
    require 'rspotify'
    Client_ID = 'c582d064dddb451baaafb42b0659f4c1'
    Client_Secret = '2ad07821e7dd40788c284a73da4c486e'
    RSpotify.authenticate(Client_ID, Client_Secret)
    ENV['ACCEPT_LANGUAGE'] = "ja"
end
