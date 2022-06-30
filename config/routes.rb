Rails.application.routes.draw do
  root "home#index"

  get "/quests", to: "quests#index"
  get "/quests/new", to: "quests#new"
  get "/quests/:id", to: "quests#show"

  resources :quests

  get "/players/new", to: "players#new"
  get "/players/:id", to: "players#show"
  get "/players", to: "players#index"
  resources :players

  get "/users/new"
  get "/users/:id", to: "users#show"

  resources :users

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "register" => "users#new", :as => "register"

  resources :sessions

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
