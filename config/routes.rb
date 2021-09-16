require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users

  root to: "imports#index"

  resources :imports
  resources :customers

end
