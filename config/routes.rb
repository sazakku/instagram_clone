Rails.application.routes.draw do
  devise_for :users

  root "feed#index"

  resources :posts
  resources :comments
  resources :profiles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
