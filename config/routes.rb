Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  resources :users, only: [:show]

  resources :shelves do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks do
    resources :likes, only: [:index, :create, :destroy]
end

  get 'incoming_controller/create'
  post :incoming, to: 'incoming#create'
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
end
