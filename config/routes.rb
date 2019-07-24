Rails.application.routes.draw do


  devise_for :users
  root 'homes#index'

  resources :users
  resources :books
  resources :homes, only: [:index]

  get 'home/about' => 'homes#top',as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
