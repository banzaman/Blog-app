Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/users', to: 'users#index'
  get '/users/745', to: 'users#show'
  get '/users/745/posts', to: 'posts#index'
  get '/users/745/posts/3', to: 'posts#show'

end