Rails.application.routes.draw do


  devise_for :users
  root to: 'homes#top'

  resources :books

  get 'homes/about' => 'homes#about'
  get 'home/about' => 'homes#about'



  resources :users, only: [:index, :show, :edit, :update]

end
