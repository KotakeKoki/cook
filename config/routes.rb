Rails.application.routes.draw do
  root to: 'recipes#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
    member do
      get :followings
      get :followers
      get :favorites
      post :edit
      delete :destroy
      patch :update
    end
  end
  resources :recipes, only: [:new, :create, :destroy, :index]  
  
  resources :recipes, only: [:create, :destroy, :edit, :show] do
    member do
      post :favorites, to: 'favorites#create'
      delete :unfavorites, to: 'favorites#destroy'
      post :edit
      get :show
      patch :update
    end 
  end
  resources :relationships, only: [:create, :destroy]
end