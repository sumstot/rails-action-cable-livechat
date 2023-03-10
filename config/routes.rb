Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  root to: "chatrooms#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: [:index, :create, :new, :destroy]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :users
  # Defines the root path route ("/")
  # root "articles#index"
end
