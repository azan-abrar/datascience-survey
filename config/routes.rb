Rails.application.routes.draw do
  resources :surveys do
  	member do
  		get :thanks
  	end
  end

  root to: 'visitors#index'
  devise_for :users, skip: :registerable
  get 'admin', to: 'visitors#admin', as: :admin
end
