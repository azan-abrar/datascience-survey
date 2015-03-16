Rails.application.routes.draw do
	resources :surveys, except: [:edit] do
		collection do
			get :intro
		end
		member do
			get :defining
			get :differentiation
			get :thanks
		end
	end

	root to: 'visitors#index'
	devise_for :users, skip: :registerable
	get 'admin', to: 'visitors#admin', as: :admin
end
