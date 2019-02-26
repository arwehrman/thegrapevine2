Rails.application.routes.draw do
  get '/' => 'sessions#welcome', as: 'welcome'
  get '/about' => 'static#about', as: 'about'
  get 'contact' =>'static#contact', as: 'contact'
  get '/signin' => 'sessions#new', as: 'signin'
  post '/login' => 'sessions#login'
  delete '/signout' => 'sessions#destroy'
  get '/mywines' => 'wines#mywines', as: 'mywines'

  resources :wines do
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
    end
    
  resources :users

end
