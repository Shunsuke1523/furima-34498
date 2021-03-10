Rails.application.routes.draw do
  devise_for :users
  get 'product_listings/index'
  root to: "product_listings#index"
  resources :product_listings, only: [:index, :new, :create]
end
