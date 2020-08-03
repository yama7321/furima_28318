Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :products do
    resources :orders, only: [:index,:create]
  end
end
