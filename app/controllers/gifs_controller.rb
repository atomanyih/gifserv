class GifsController < ApplicationController
  def show
    render text: images.to_s
  end

  def random_gif
    image = File.open(images.sample)
    
    send_data image.read, type: "image/gif", disposition: "inline"
  end

private
  
  def images
    Dir[Rails.root.join("app","assets","images","*.gif")]
  end
end
