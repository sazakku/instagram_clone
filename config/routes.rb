Rails.application.routes.draw do
  devise_for :users

  root "feed#index"

  resources :posts do
    resources :comments do
      put 'like', on: :member
      delete 'unlike', on: :member
    end
  end
  resources :profiles
  # Routes for follow
  put '/profiles/:id/follow', to: 'profiles#follow', as: 'follow'
  delete '/profiles/:id/unfollow', to: 'profiles#unfollow', as: 'unfollow'
  # Routes for likes
  put '/posts/:id/like', to: 'posts#like', as: 'like'
  delete '/posts/:id/unlike', to: 'posts#unlike', as: 'unlike'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
