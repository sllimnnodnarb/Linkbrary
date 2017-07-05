Rails.application.routes.draw do

  get 'incoming_controller/create'
  post :incoming, to: 'incoming#create'

  resources :shelves do
    resources :bookmarks
  end

  devise_for :users

  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
end
