Rails.application.routes.draw do
  resources :gyms, only: [:show, :destroy] do
    resources :memberships, only: [:create]
  end

  resources :clients, only: [:show, :index, :update] do
    get 'memberships/total-amount', to: 'clients#total_amount'
  end
  
  # resources :memberships
  # resources :clients
  # resources :gyms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
