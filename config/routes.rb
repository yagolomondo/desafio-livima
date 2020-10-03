Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get :home, to: 'pages#home'
  resources :employees
end
