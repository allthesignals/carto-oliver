Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :tables

    root to: "categories#index"
  end

  root to: "map#index"
  resources :tables
  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
