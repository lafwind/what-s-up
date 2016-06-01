Rails.application.routes.draw do
  get 'static_pages/home'

  devise_for :users

  resources :users, only: [:show] do
    member do
      get "groups", to: "users#groups"
      get "posts", to: "users#posts"
      get "liked", to: "users#liked"
    end
    resources :groups do
    end
  end

  resources :posts do
    resources :comments

    collection do
      get :recent
      get "active", to: "posts#active"
      get "popular", to: "posts#popular"
    end
    member do
      get "like", to: "posts#like"
      get "unlike", to: "posts#unlike"
      put "share", to: "posts#share"
    end
  end

  authenticated :user do
    root 'posts#index', as: 'authenticated_root'
  end

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
