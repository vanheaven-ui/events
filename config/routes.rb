Rails.application.routes.draw do
  root 'sessions#welcome'
  resources :users, only: %i[new create show edit update]
  resources :events, only: %i[new create show index]
  get '/welcome', to: 'sessions#welcome'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'
  post '/attend', to: 'event_attendings#create'
end
