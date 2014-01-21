Gifserve::Application.routes.draw do
  resources :gifs, only: :show
  get ":all", to: "gifs#random_gif", constraints: { :all => /.*\.gif/ }
end
