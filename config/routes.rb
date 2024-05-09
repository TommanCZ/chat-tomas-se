Rails.application.routes.draw do
  root 'chatroom#index'

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]
  
  resources :users, controller: 'clearance/users', only: [:create] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  #get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  #delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  #get '/sign_up' => 'clearance/users#new', as: 'sign_up'

  post 'chatroom/create_message'

  resources :users, only: [:index, :new, :create]
    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    # Defines the root path route ("/")
    # root "posts#index"
  end
