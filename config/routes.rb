Rails.application.routes.draw do
  devise_for :users
  root to: "product_listings#index"
  resources :product_listings, only: [:index, :new, :create, :show]
end
