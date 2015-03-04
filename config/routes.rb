Rails.application.routes.draw do
  get 'reports/customers_and_products'

  get 'reports/customers_and_categories'

  get 'reports/employee_sales_per_quarter'

  get 'reports/most_popular_products_per_category'

  get 'reports/employee_sales_per_month'

  resources :customers
  resources :categories
  resources :employees
  resources :orders
  resources :order_details
  resources :products

  root "customers#index"
end
