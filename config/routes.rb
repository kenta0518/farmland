Rails.application.routes.draw do
  #resources :posts, only: [:index,:new,:create]
  post "posts/new" =>"posts#create"
  get "posts/new" =>"posts#new"
  get 'posts/index' =>"posts#index"
  get '/', to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
