Rails.application.routes.draw do
  get 'orders/:id/pay', to:'orders#pay', as:'order_pay'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'products#index'
  resources :products
  resources :orders
  resources :order_products

end
