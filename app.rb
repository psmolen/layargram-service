require 'sinatra'
require './models/hotspots.rb'

get '/' do
  content_type :json
  {hotspots: Hotspots.instagram_hotspots(params[:lat], params[:lon]), layer: params[:layerName], errorCode: 0, errorString: :ok}.to_json
end
