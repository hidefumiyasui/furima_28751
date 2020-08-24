Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # :controllers => {
  #   :registrations => 'users/registrations'
  #  }
  resources :items 
  # post 'users/sign_up', to: 'users/registrations#new'
end
