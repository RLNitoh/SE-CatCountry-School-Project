Rails.application.routes.draw do

  get 'search/index'
  # resources :rooms do 
  #   resources :messages
  # end
  
  get 'home/index'
  devise_for :users

  # devise_scope :user do 
  #   get 'users', to: 'devise/sessions#new'
  # end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to:redirect('/title')

  
  
  get 'help', to: 'pages#help', as: 'help'
  get 'search', to: 'pages#search', as: 'search'
  get 'editprofile', to: 'pages#editprofile', as: 'editprofile'
  get 'users', to: 'users#show', as: 'users'
  patch 'game/:id', to: 'games#check'
  get 'game/:id', to: 'games#show', as: 'game'
  get 'title', to: 'pages#title', as: 'title'
  get 'home', to: 'pages#home', as: 'home'

  get 'posts', to: 'posts#index', as: 'posts'
  post 'posts', to: 'posts#create'
  get 'posts/new', to: 'posts#new', as: 'new_post'
  get 'posts/:id/edit', to: 'posts#edit', as: 'edit_post'
  patch 'posts/:id', to: 'posts#update'
  get 'posts/:id', to: 'posts#show', as: 'post'
  delete 'posts/:id', to: 'posts#destroy'


  get 'trending/newest', to: 'trending#newest', as: 'trending_newest'
  get 'trending/oldest', to: 'trending#oldest', as: 'trending_oldest'
  get 'trending/today', to: 'trending#today', as: 'trending_today'
  get 'trending/this-week', to: 'trending#week', as: 'trending_this_week'

  
  patch '/users/:id', to: 'users#report_user_update'
  put '/users/:id', to: 'users#report_user_update'
  get '/users/:id/report-user', to: 'users#report_user', as: 'report_user'
  
  
  # Map requests to users/:id to user controller "show"
  # Map requests to users/:id to user
  # Maps requests to users/:id/edit
  resources :users, only: [:show, :edit, :update, :report_user, :report_user_update]
  resource :posts, only: [:new, :create, :show, :destroy]

  # Searching for posts by hashtag
  get 'search' => 'search#index'


end
