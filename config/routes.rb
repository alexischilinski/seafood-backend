Rails.application.routes.draw do
  resources :user_fishes
  resources :users
  resources :regions
  resources :fish

  post "login", to: "authentication#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
