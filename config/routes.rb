Rails.application.routes.draw do
  devise_for :users
  root to: 'places#index'
  resources :bookings, only: [:destroy, :show]
  resources :places, only: [:show, :edit, :update, :new, :create, :destroy] do
    resources :bookings, only: [:create, :new]
  end
  get 'mybookings', to: "bookings#my_bookings"
  get 'myplaces', to: 'places#my_places'

  # devise_for :users
  # root to: "pages#home"
  # root to: 'places#index'
  # get "/about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
