Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :messages, only: :create do
    member { post :like }
  end
  resources :rooms, only: %i[show create], param: :name

  # Defines the root path route ("/")
  root "rooms#index"
end
