Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get 'twilio/voice'

  get 'access/index'
  get '/login', to: 'access#login'
  get '/signup', to: 'users#new'
  get 'logout', to: 'access#logout'
  get 'static_pages/home'
  get 'static_pages/help'
  
  resources :pins
  resources :users
  #match 'home' => 'users#index' , via:[:get, :post]
  root 'users#index'
  match ':controller(/:action(/:id))', :via => [:get, :post]

  #twilio
  post 'twilio/voice' => 'twilio#voice'
  post 'messages/notify' => 'messages#notify'

end
