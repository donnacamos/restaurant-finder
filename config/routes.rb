Rails.application.routes.draw do

  get '/' => 'sessions#home' 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' 
  post '/signup' => 'users#create' 
  delete '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
 
  resources :restaurants 

  resources :restaurants do 
    resources :reviews, only: [:new, :index] 
    resources :companies, only: [:new, :index]
  end 
  
  resources :users, only: [:show] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
