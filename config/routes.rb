Rails.application.routes.draw do
  resources :customers do
  	member do 
  	  get 'check_out'
  	end  	
  end	
  resources :rooms
  resources :room_types


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
