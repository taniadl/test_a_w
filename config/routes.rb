Rails.application.routes.draw do
  devise_for :users
  get 'pages/contact', to: 'pages#contact', as: :contact
  get 'pages/about', to: 'pages#about', as: :about

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects, only: [:index, :show, :new, :create]
  resources :contents, only: [:index, :new, :create, :show, :destroy, :update]
end
