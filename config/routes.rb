Rails.application.routes.draw do

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/trails", to: "trails#index"
  get "/trails/:trail_id", to: "trails#show", as: "trail"
  get "sessions/", to: "trails#index"
  root "trails#index"
end
