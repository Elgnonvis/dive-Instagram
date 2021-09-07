Rails.application.routes.draw do
  
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  root 'posts#index'
  # get '/profil', to: 'users#show', as: :profil
  # patch "/profil", to: "users#update"

  #Session
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:create, :destroy, :index]
  
  resources :posts do
    collection do
    post :confirm
    end
  end

end
