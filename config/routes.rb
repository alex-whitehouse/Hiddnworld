Rails.application.routes.draw do
get "signup", to: "users#new", as: "signup"
get "login", to: "sessions#new", as: "login"
get "logout", to: "sessions#destroy", as: "logout"

  resources :users
  get "/sessions/current", to: "sessions#destroy"
  
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/trails", to: "trails#index"
  get "/trails/:trail_id", to: "trails#show", as: "trail"
  
  root "trails#index"
end
