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
  post "/nodes/check_answer", to: "nodes#checkanswer", as: "check_answer"
  
  root "trails#index"

  get "/admin/trails", to: "trails#admin_index", as: "admin"
  get "/admin/trails/:id", to: "trails#admin_show"


end
