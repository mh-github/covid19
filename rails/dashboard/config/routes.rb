Rails.application.routes.draw do
  # get 'dashboard/cgdc'
  # get 'dashboard/cgdd'
  # get 'dashboard/cidc'
  # get 'dashboard/cidd'

  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
    root 'home#index'
    post 'display_router', to: 'home#display_router'
    post 'home/display_router', to: 'home#display_router'
    get  'home/gdc'
    get  'home/gdd'
    get  'home/idc'
    get  'home/idd'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
