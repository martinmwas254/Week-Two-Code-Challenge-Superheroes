Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :heros, only: [:show, :index]
  resources :powers,only: [:show, :index, :update]
  resources :hero_powers, only [:create]
end
