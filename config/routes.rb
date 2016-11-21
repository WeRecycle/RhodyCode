Rails.application.routes.draw do
  resources :tags
  root to: 'projects#dashboard'

  devise_for :users
  resources :projects

  resources :users, only: [:show]

  get "/help", to: "static#help"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
