Rails.application.routes.draw do

  resources :shelves do
    resources :bookmarks
  end

  devise_for :users

  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
end
