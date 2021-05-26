Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get "posts/search"=>"posts#search"
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  resources :posts do
    resources :reservations
  end
  resources :relationships, only: [:create, :destroy]
  get '/reservations' => 'reservations#index' 
  get '/lend' => 'reservations#lend'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
