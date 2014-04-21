Texter::Application.routes.draw do
  root to: 'messages#new'
  resources :messages
end
