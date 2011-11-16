require 'sinatra'
require 'geocoder'

#
# Launch Sinatra with Geocoder to return your city and country
# 

get "/" do
  "Hello from #{request.ip} [#{request.location}] - #{request.location.city} #{request.location.country}"
end