Rails.application.routes.draw do
 resources :recipes, only: [:index, :create]
 resources :users, only: [:create], path: "/signup"
 get "/me", to: "users#show"
 post "/login", to: "sessions#create"
 delete "/logout", to: "sessions#destroy"
end
