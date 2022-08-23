Rails.application.routes.draw do
  get "session/new"
  get "session/create"
  get "session/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :articles
  root "pages#home"
  get "signup", to: "users#new"
  resources :users, except: [:new]
  # route for deleting a user
  get "users/:id/delete", to: "users#delete", as: "delete_user"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
