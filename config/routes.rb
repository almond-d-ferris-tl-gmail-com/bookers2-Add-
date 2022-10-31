Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top', as: "root"
  get "home/about", to: "homes#about", as: "about"

  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]# :new,
  resources :users, only: [:index, :show, :edit, :update]

  get '/search', to: 'searches#search'

end