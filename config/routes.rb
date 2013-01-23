Rails3BootstrapDeviseCancan::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :courses
  resources :requests
  #resources :topics  
  #match ':controller(/:action(/:id(.:format)))'

	namespace :admin do
		 resources :courses
		  resources :topics 
		#get 'abc', to: 'dashboard#index', as: '/'
	end 

  match ':controller(/:action(/:id))(.:format)' 
end
