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
	resources :users, only: [:create]
	resources :sessions, only: [:create]
	resources :queue_items, only: [:index]

	# a queue item - has a video.title, user's video rating, and its genre
	# a queue could be a separate resource, or a resource belonging to a user
	# it could also just be some data ie: user pos1.video, pos2.video
	# it could be a queue is a collection of queue item model
	# a user has one queue, a queue belongs to a user
	# a queue has_many videos, a video belongs_to many queues
	#
	# Think about what you want the URL to just be
	#  "/my_queue"
	#
	# create new actions in User or Video controllers
	# create new queue controller
	#
	# Basically, create a new Controller when you want to start thinking of that something as its own entity with its own actions:
	# what would the actions on a queue be:
	# (maybe) create
	# update
	#
	# Don't break something out into a new controller just because the default REST options don't provide a specific member action for what you need.
	# for comparison, on a review the actions were:
	# create only
	# 
	#


end
