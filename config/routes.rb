Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :recipes, only: [:index, :new, :create, :edit, :update, :show]
  resources :users, only: :show
  resources :plans, only: [:create, :destroy]
  resources :refrigerators, only: [:create, :destroy]
end
