Rails.application.routes.draw do

  resources :relationships
  resources :ribbits
  resources :users

  root to: 'users#new'

  get 'buddies', to: 'users#buddies', as: 'buddies'


  get 'sessions/new'

  post 'sessions/create'

  get 'sessions/destroy'
  
end
