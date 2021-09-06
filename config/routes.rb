Rails.application.routes.draw do
  resources :posts
  get '/profil', to: 'users#edit', as: :profil
  patch "/profil", to: "users#update"

  #Session
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session
  resources :users, only: [:new, :create, :show, :edit]
end
