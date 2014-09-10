Rails.application.routes.draw do

  root :to => 'home#index'
  get 'home/index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :images
  resources :ads

match ':controller(/:action(/:id(.:format)))' => 'home#show', via: [:get, :post]
end
