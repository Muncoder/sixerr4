Rails.application.routes.draw do

  devise_for :users,
    :path => '',
    :path_name => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
    :cmontrollers => {:omniauth_callbacks => 'omniauth_callbacks',
                    :registrations => 'registrations'}

  root "pages#home"

  resources :products do
  	resources :orders, only: [ :create]
  end

  resources :orders, only: [ :show ]

  get "my_products" => "products#my_products"

  get "my_purchases" => "pages#my_purchases"
  get "my_sales" => "pages#my_sales"

  resources :charges, only: [ :create ]

  get "search" => "pages#search"

  resources :contacts, only: [ :new, :create ]

end