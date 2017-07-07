Rails.application.routes.draw do

  get 'likes/index'

  devise_for :users
  devise_for :admins

  get 'incoming_controller/create'
  post :incoming, to: 'incoming#create'

  resources :shelves do
    resources :bookmarks do
      resources :likes
    end
  end

  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
end
