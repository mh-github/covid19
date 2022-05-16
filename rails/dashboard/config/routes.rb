Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'
  post '/display_router', to: 'home#display_router'
  post '/home/display_router', to: 'home#display_router'
  get  'home/gdc'
  get  'home/gdd'
  get  'home/idc'
  get  'home/idd'
  
end
