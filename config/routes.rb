Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :requests do
    get '/confirm_email', to: 'requests#confirm_email', as: :confirm_email
  end
end
