Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :groups do
    end
  end

  resources :posts do
    member do
      get "like", to: "posts#like"
      put "share", to: "posts#share"
    end
  end

  root 'posts#index'
end
