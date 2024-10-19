Rails.application.routes.draw do
  devise_for :users
  root 'courses#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :courses, only: [:index, :show] do
    post 'buy', to: 'checkouts#create', as: 'buy'
  end

  post 'checkout/create', to: 'checkouts#create'
  get 'success', to: 'checkouts#success'
  get 'cancel', to: 'checkouts#cancel'

  post '/webhooks/stripe', to: 'webhooks#stripe'
end
