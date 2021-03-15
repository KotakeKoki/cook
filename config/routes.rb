Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'recipes#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
    member do
      get :followings
      get :followers
    end
  end

  resources :recipes
  resources :relationships, only: [:create, :destroy]
  

end
