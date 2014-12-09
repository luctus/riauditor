Rails.application.routes.draw do

  resources :accounts

  root 'home#index'

end
