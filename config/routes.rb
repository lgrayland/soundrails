Rails.application.routes.draw do

  devise_for :users

  resources :users

  authenticated :user do
    root to: "users#show", as: :authenticated_root
  end

  unauthenticated do
    root to: "home#index"
  end
  
  resources :genres
  resources :tracks do
    collection do
get :tracks_with_comments_needing_approval
    end
    resources :comments do
      collection do
        put :approve
      end
    end
  end

end
