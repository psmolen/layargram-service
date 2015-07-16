require 'sinatra'
require 'instagram'

get '/' do
  content_type :json
  client = Instagram.client(client_id: ENV["INSTAGRAM_CLIENT_ID"])
  hotspots = []
  for media_item in client.media_search("37.7808851","-122.3948632")
    hotspots << {id: media_item[:id], imageURL: media_item[:images][:low_resolution][:url], anchor: {geolocation: {lat: media_item[:location][:latitude], lng: media_item[:location][:longitude]}}}
  end
  hotspots.to_json
end
