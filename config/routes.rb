Rails.application.routes.draw do
  root "quests#index"

  get "/quests", to: "quests#index"
  get "/quests/:id", to: "quests#show"

  resources :quests

  get "/players/new"

  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
