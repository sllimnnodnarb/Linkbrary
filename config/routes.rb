Rails.application.routes.draw do
  resources :bookmarks
  resources :shelves
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
end
