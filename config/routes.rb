Rails.application.routes.draw do

  resources :histories
  get 'sessions/new'

  get 'users/new'

  get 'static_pages/home'

  get 'static_pages/help'

  get  'static_pages/about'

  get    "sessions/new"

  post   'sessions/create'

  delete 'sessions/destroy'

  get 'cars/result'
  get 'cars/search'
  get 'cars/checkout'
  post 'cars/checkout1'
  get 'cars/return'
  get 'cars/help_rent'
  post 'cars/help_rent'
  post 'cars/result'
  get 'cars/help_return'
  get 'histories/new'
  post 'histories/create'
  get 'cars/reserve'
  get 'cars/help_reserve'
  get 'cars/reserve1'
  post 'cars/reserve1'
  post 'histories/gx'
  get 'viewhistory', to: 'cars#viewhistory'
  resources :users
  resources :cars
  resources :histories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
