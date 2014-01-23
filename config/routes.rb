Gifserve::Application.routes.draw do
  get "imgur/:album_id", to: "gifs#random_gif"
end
