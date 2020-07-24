Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  root to: "users#welcome"

  resources :articles, only: [:index, :show]
end
