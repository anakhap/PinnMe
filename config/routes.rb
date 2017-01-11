Rails.application.routes.draw do

  get 'twilio/voice'

  get 'access/index'
  get '/login', to: 'access#login'
  get '/signup', to: 'users#new'
  get '/logout', to: 'access#logout'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/contact', to:'static_pages#contact'

  #home_path -> '/home'
  #help_path -> '/help'
  #contact_path -> '/contact'
  
  resources :pins
  resources :users
  #match 'home' => 'users#index' , via:[:get, :post]
  root 'static_pages#home'
  match ':controller(/:action(/:id))', :via => [:get, :post]

  #twilio
  post 'twilio/voice' => 'twilio#voice'
  post 'messages/notify' => 'messages#notify'

end
