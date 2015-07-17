require 'instagram'

class Hotspots

  def self.instagram_hotspots(lat,lon)
    client = Instagram.client(client_id: ENV["INSTAGRAM_CLIENT_ID"])
    
    hotspots = client.media_search(lat,lon).map do |media_item|
      {
        id: media_item[:id],
        icon: 
        {
          url: media_item[:images][:low_resolution][:url]
        },
        anchor: 
        {
          geolocation: 
          {
            lat: media_item[:location][:latitude], 
            lon: media_item[:location][:longitude]
          }
        }, 
        text: 
        {
          title: "", 
          description: media_item[:caption] ? media_item[:caption][:text] : ""
        }, 
        imageURL: media_item[:images][:low_resolution][:url], 
        actions: 
        [{
          uri: media_item[:link], 
          label: "View Image", 
          contentType: "text/html"
        }]
      }
    end

  end

end
