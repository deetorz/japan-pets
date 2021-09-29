Rails.application.routes.draw do
  root 'pets#index'
  resources :pets, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
