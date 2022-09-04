Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top', as: "top"
  get "homes/about" => "homes#about", as: "about"
  resources :books, only: [:create, :index, :show, :destroy, :edit]# :new,
  resources :users, only: [:index, :show, :edit, :update]
end