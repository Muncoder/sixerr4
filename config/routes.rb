Rails.application.routes.draw do

  devise_for :users
  root "pages#home"

  resources :products do
  	resources :orders, only: [ :create]
  end

  resources :orders, only: [ :show ]

  get "my_products" => "products#my_products"

  get "my_purchases" => "pages#my_purchases"
  get "my_sales" => "pages#my_sales"

  resources :charges, only: [ :create ]

end