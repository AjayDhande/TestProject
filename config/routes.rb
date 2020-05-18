Rails.application.routes.draw do
  root 'home#index'
  post 'home/upload_image'
  match "home/game", as: :home_game, via: [:get, :post]  
end
