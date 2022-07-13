Rails.application.routes.draw do
  devise_for :users

  root "feed#index"

  resources :posts do
    resources :comments
  end
  resources :profiles
  put '/profiles/:id/follow', to: 'profiles#follow', as: 'follow'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
