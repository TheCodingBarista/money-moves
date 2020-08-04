Rails.application.routes.draw do
  resources :entries do
    resources :notes
  end

  #namespace :spotify do
  #  get '/episodes/search'
  #end
  
  devise_for :users, path: '/', path_names: {sign_in: 'login', sign_out: 'logout', registration: 'register' }, controllers: { omniauth_callbacks: 'omniauth' }
  
  root to: "feed#index"

  delete 'logout', to: 'sessions#destroy'

  match '/star', to: 'stars#star', via: :post
  match '/unstar', to: 'stars#unstar', via: :delete
end
