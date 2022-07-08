Rails.application.routes.draw do
  devise_for :users,path_prefix: "devise", controllers: { registrations: "registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  devise_scope :user do
    post "login" => "sessions#create", as: "login"
    delete "logout" => "sessions#destroy", as: "logout"
    put "password/update", to: "registrations#update_password"
    put "password/reset", to: "registrations#reset_password"
  end
  resources :users, only: [:show, :create, :update, :destroy], constraints: { id: /.*/ }
end
