Rails.application.routes.draw do
  root :to => "customers#index"

  resources :customers do
  	member do 
  	  get 'check_out'
  	end  	
  end	

  resources :rooms do
  	collection do
  	  get 'available'
  	end
  end	  	

  resources :room_types
  match 'find_customers', to: 'customers#search', via: [:get, :post]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
