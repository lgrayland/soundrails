Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :index]

  authenticated :user do
    root to: "users#show", as: :authenticated_root
  end

  unauthenticated do
    root to: "home#index"
  end
  resources :genres
  resources :tracks

end
