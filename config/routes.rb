Rails.application.routes.draw do
  resources :bloggers, only: [:new,:edit,:show,:create,:index]
  resources :destinations, only: [:index,:show]
  resources :posts, only: [:index,:show,:create,:new]
  post '/posts/:id/like', to: 'posts#like', as: "like"
end
