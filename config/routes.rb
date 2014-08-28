Rails.application.routes.draw do
  resources :customers
  resources :categories
  resources :employees
  resources :orders
  resources :order_details
  resources :products

  root "customers#index"
end
