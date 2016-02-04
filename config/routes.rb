Rails.application.routes.draw do

  get 'buddies', to: 'users#buddies', as: 'buddies'

  delete 'ribbits/destroy'

  resources :relationships
  resources :ribbits
  resources :users

  root to: 'users#new'



  get 'sessions/new'

  post 'sessions/create'

  get 'sessions/destroy'

  delete 'ribbits/destroy'
  
end
