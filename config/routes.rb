Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'customers#index'  # Route for the index action
  get 'customers/alphabetized', to: 'customers#alphabetized', as: 'alphabetized_customers'
  get 'customers/missing_email', to: 'customers#missing_email', as: 'customers_missing_email'
  resources :customers  # This line creates standard RESTful routes for customers
end
