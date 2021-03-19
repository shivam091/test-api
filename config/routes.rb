Rails.application.routes.draw do
  resources :products, only: :index
  resources :news, only: :index
end
