Rails.application.routes.draw do
  devise_for :users
  root 'posts#index', as: 'home'

  get 'about', to:'pages#about', as: 'about'

  resources :posts do
    resources :comments
  end
end
