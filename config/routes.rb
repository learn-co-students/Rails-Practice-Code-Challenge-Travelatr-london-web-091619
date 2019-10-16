Rails.application.routes.draw do

  # Blogger Routes
  get '/bloggers/', to: 'bloggers#index', as: 'bloggers'
  get '/bloggers/new/', to: 'bloggers#new', as: 'new_blogger'
  post '/bloggers/', to: 'bloggers#create'
  get '/bloggers/:id', to: 'bloggers#show', as: 'blogger'

  # Posts Routes
  get '/posts/', to: 'posts#index', as: 'posts'
  get '/posts/new/', to: 'posts#new', as: 'new_post'
  post '/posts/', to: 'posts#create'
  get '/posts/:id/', to: 'posts#show', as: 'post'
  get '/posts/:id/like/', to: 'posts#like', as: 'like'
  get '/posts/:id/edit/', to: 'posts#edit', as: 'edit_post'
  patch '/posts/:id', to: 'posts#update'

  # Destination Routes
  resources :destinations, only: [:show]
end
