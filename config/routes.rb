Rails.application.routes.draw do

  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  
  get '/users/:id/following', to: 'users#following', as: 'following'
  get '/users/:id/followers', to: 'users#followers', as: 'followers'
end
