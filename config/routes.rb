Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  root to: 'recipes#index'
  resources :recipes
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
end
