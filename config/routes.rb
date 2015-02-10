Rails.application.routes.draw do
  root :to => 'pages#index'

  resources :users, :reviews

  resources :artists do
    resources :events
  end

  resources :events do
    member do
      get :add_artist
      post :create_artist
    end
    resources :reviews
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  post '/events/results' => 'events#results'
end
