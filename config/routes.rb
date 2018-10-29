Rails.application.routes.draw do

  resources :friends
  resources :schedules
  root to: 'calendar#index' 
  get '/:year/:month', to: 'calendar#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
