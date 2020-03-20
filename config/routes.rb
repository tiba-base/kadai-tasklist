Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'users/create'
    root to: 'tasks#index'
    
    get 'signup',to: 'users#new'
    resources :users, only: [:show, :new, :create]
end