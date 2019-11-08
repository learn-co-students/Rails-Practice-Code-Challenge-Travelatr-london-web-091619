Rails.application.routes.draw do
  resources :destinations, only: [:show]
  resources :posts, only: %i[new create edit update show]
  resources :bloggers, only: %i[new create show]
  get "/posts/:id/like", to: "posts#increment_likes", as: "like_post"
end
