Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'welcome#index'
  resources :categories, only: [:index, :show]
  get 'categories/:category', to: 'categories#show', as: 'category_items'
  #  get 'categories', to: 'categories#index', as: 'categories'
  #  get 'categories/:id', to: 'categories#show', as: 'category'
  # Root route
  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # Defines the root path route ("/")
  # root "posts#index"
end
