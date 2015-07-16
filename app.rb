require 'sinatra'
require 'instagram'

get '/' do
  content_type :json
  client = Instagram.client(client_id: ENV["INSTAGRAM_CLIENT_ID"])
  hotspots = []
  for media_item in client.media_search(params[:lat],params[:lon])
    hotspots << {id: media_item[:id], icon: {url: media_item[:images][:low_resolution][:url]}, anchor: {geolocation: {lat: media_item[:location][:latitude], lon: media_item[:location][:longitude]}}}
  end
  {hotspots: hotspots}.to_json
end
