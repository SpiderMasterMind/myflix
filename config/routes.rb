Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

	root to: 'videos#index'

	get '/home' => 'videos#index'

	resources :videos


end
