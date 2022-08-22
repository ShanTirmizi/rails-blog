Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :articles
  root "pages#home"
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
