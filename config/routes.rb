Rails.application.routes.draw do
  root :to => 'users#index'

  resources :artists, :events, :users, :reviews

  # get '/login' => 'session#new'
  # post '/login' => 'session#create'
  # delete '/login' => 'session#destroy'
end
