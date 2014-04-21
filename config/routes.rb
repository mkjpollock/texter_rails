Texter::Application.routes.draw do

  root to: 'messages#new'
  devise_for :users
  resources :users
  resources :messages
  resources :contacts

end
