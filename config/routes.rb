Rails.application.routes.draw do
  resources :trails do
    resources :reviews, only: [:new, :show, :index]
  end

  resources :reviews

  get '/locations', to: 'application#welcome'

  root to: 'application#welcome'

  get 'home', to: 'application#home'
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
