Rails.application.routes.draw do
  get "categories/show"
  root "requests#index"
  resources :requests
  resources :categories, only: [:show]
end