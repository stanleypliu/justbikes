Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bicycles do
    resources :bookings, only: [:show, :new, :create]
    resources :reviews, only: [:show, :new, :create, :index]
  end
  resources :reviews, only: [:destroy]
end