Rails.application.routes.draw do
  resources :trails, only: [:new, :create, :show, :index] do
    resources :reviews, only: [:new, :show, :index]
  end

  resources :reviews

  get '/locations', to: 'application#welcome'

  get '/locations/:location_id/trails', to: 'trails#index'

  root to: 'application#welcome'

  get 'home', to: 'application#home'

  get '/search', to: 'trails#search'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
