Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  resources :posts do
    member do
      get "like", to: "posts#like"
    end
  end

  root 'posts#index'
end
