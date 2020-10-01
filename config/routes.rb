Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #exposing the routes for every action you can perform for articles
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  #Since the above lists out every route that you can perform you can write this code as:
  resources :articles
  #For users to see and sign up on the form
  get 'signup', to: 'users#new'
  #You can use the post method below for the users to actually submit the form
  #post 'users', to: 'users#create'
  #Or you can use the resources method below to get all of the routes except new
  resources :users, except: [:new]
end
