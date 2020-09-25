Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #exposing the routes for every action you can perform for articles
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  #Since the above lists out every route that you can perform you can write this code as:
  resources :articles
end
