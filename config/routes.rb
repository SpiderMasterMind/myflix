Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

	root to: 'pages#front'
	get '/home' => 'videos#index'

	resources :videos, only: [:show] do
		collection do
			get 'search'
		end

		resource :reviews, only: [:create]
	end

	get 'register', to: "users#new"
	get 'sign_in', to: "sessions#new"
	get 'sign_out', to: "sessions#destroy"
	resources :users, only: [:create]
	resources :sessions, only: [:create]


end
