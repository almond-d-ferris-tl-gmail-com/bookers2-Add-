Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top', as: "root"
  get "homes/about" => "homes#about", as: "about"
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]# :new,
  resources :users, only: [:index, :show, :edit, :update]
  #patch 'books/:id/edit' => 'books#update'

end