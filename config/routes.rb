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
	get 'my_queue', to: "queue_items#index"
	post 'update_queue', to: "queue_items#update_queue"

	# post to queue_items#create

	resources :users, only: [:create]
	resources :sessions, only: [:create]
	resources :queue_items, only: [:create, :destroy]

end
