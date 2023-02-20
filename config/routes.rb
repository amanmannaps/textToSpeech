Rails.application.routes.draw do
  post 'messages', to: 'messages#create'

  get '/serviceworker.js', to: 'serviceworker#serviceworker'
  devise_for :users
  root 'pages#home'
  #resources :messages, only: [:create, :show, :index]
  resources :rooms do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
