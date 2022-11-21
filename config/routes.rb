Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "stocks#index"

  get "/transactions/search", to: "transactions#search"

  resources :stocks
  resources :transactions
end
