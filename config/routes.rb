Rails.application.routes.draw do

  resources :bloggers, only: [:new, :create, :show]
  resources :destinations, only: :show
  resources :posts, only: [:new, :create, :show]
  post '/posts/:id/like', to: 'posts#like', as: 'like'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
