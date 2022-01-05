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
  get "/admin/trails/:trail_id", to: "trails#admin_show", as: "admin_show"
  post "/admin/trails", to: "trails#trail_create", as: "trail_create"

  get "admin/update/:trail_id", to: "trails#admin_show_update", as: "admin_show_update"
  post "admin/update/:trail_id", to: "nodes#update", as: "node_update" 


  post "/admin/trails/:trail_id", to: "trails#node_create", as: "node_create"


   

end
