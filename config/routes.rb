Rails.application.routes.draw do

  resources :accounts do
    get :audit, on: :member
  end

  root 'home#index'

end
