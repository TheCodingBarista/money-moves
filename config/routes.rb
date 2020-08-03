Rails.application.routes.draw do
  namespace :spotify do
    get '/episodes/search'
  end
  
  devise_for :users, path: '/', path_names: {sign_in: 'login', sign_out: 'logout', registration: 'register' }, controllers: { omniauth_callbacks: 'omniauth' }
  
  root to: "users#welcome"

  get '/home', to: 'feed#index'
  get '/featured', to: 'feed#featured'
  get '/small', to: 'feed#small'

  resources :articles, only: [:index, :show]
end
