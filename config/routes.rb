Rails.application.routes.draw do
  root 'sessions#welcome'
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy welcome]
  resources :events, oly: %i[new create show index]
  get "/welcome", to: "sessions#welcome"
  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"
end
