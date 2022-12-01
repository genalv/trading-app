Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "stocks#index"

  get "/stocks/search", to: "stocks#search"

  get "/sell_stock/:symbol", to: "stocks#sell_stock", as: "sell_stock"
  get "/buy_stock/:symbol", to: "stocks#buy_stock", as: "buy_stock"

  namespace :admin do
    resources :stocks, :transactions, :users
  end

  get "/admin/pending_users", to: "admin/users#pending_users"

  resources :stocks
  resources :transactions
end
