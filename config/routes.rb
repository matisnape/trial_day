Rails.application.routes.draw do
  root 'fundraisers#index'

  resources :fundraisers, only: [:index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
