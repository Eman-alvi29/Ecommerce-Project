Rails.application.routes.draw do
  get "static/about_us"
  get "static/contact_us"
  get "about_us", to: "static#about_us"
  get "contact_us", to: "static#contact_us"
  resources :categories, only: [:index, :show]
  get "users/profile"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'profile', to: 'users#profile', as: :user_profile
  root 'welcome#index'
  resources :items, only: [:index, :show]
  resources :orders do
    get 'add_to_cart', on: :collection
    resources :order_items, only: [:destroy]
    resources :payments, only: [:new, :create]
  end
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
