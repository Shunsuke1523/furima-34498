Rails.application.routes.draw do
  devise_for :users
  root to: "product_listings#index"
  resources :product_listings do
    resources :purchase_managements, only: [:index, :create]
  end
end
