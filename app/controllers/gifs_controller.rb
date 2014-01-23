require 'open-uri'
require 'httparty'

class GifsController < ApplicationController
  def random_gif
    image_url = get_images_from_album(params[:album_id]).sample
    send_data URI(image_url).read, type: "image/gif", disposition: "inline" if image_url
  end

  def get_images_from_album(album_id)
    client_id = ENV["IMGUR_CLIENT_ID"]

    response = HTTParty.get("https://api.imgur.com/3/album/#{album_id}",
      headers: {
        "Authorization" => "Client-ID #{client_id}"
    })
    if response.success?
      album_data = JSON.parse(response.body)
      album_data["data"]["images"].map{|i| i["link"] }
    else
      []
    end
  end
end
