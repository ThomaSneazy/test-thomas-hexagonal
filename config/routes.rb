Rails.application.routes.draw do
  devise_for :users
  root to: "desks#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :desks do
    resources :requests, only: [:index, :show, :create]
  end
end
