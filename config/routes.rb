Rails.application.routes.draw do
    get '/' => 'sessions#welcome', as: 'welcome'
    get '/signin' => 'sessions#new', as: 'signin'
  post '/login' => 'sessions#login'
  delete '/signout' => 'sessions#destroy'


  resources :wines
  resources :users
  resources :comments
end
