Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:id/posts/new', to: 'posts#new', as: 'user_post_new'
  post '/users/:id/posts/create', to: 'posts#create', as: 'user_post_create'
  get '/users/:id/posts/:post_id', to: 'posts#show', as: 'post_comments'

  post '/users/:id/posts/:post_id/create', to: 'comments#create', as: 'post_comments_create'
  post '/users/:id/posts/:post_id/like', to: 'likes#create', as: 'post_likes_create'

end