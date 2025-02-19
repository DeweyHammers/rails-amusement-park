Rails.application.routes.draw do
  root 'application#home'
  resources :users
  resources :rides
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
