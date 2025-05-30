Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :books, only: [:index, :show]
  get "profile", to: "pages#profile"
  get "profile/:id", to: "pages#profile"
  get "dashboard", to: "pages#dashboard"
  post "requests", to: "requests#create", as: "request_create"
  post "requests", to: "requests#accept", as: "request_accept"
  post "requests", to: "requests#reject", as: "request_reject"
  post "requests", to: "requests#expire", as: "request_expire"
end
