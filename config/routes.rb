Rails.application.routes.draw do

  devise_for :users

  resources :accounts do
    get :audit, on: :member
  end

  root 'accounts#index'

end
