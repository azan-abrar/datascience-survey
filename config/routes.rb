Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  get 'admin', to: 'visitors#admin', as: :admin
end
