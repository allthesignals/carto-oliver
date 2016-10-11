Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :tables

    root to: "categories#index"
  end

  jsonapi_resources :tables 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
