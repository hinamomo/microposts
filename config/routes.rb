Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'login'  , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup' , to: 'users#new'
  get 'edit', to:'users#edit'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
