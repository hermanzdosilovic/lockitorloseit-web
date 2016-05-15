Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'admin/sessions'
  }
  resources :orders
  root to: 'home#index'
end
