Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'admin/sessions'
  }
  resources :orders, only: [:create]
  root to: 'home#index'
  namespace :admin do
    root to: 'admin#index'
  end
end
