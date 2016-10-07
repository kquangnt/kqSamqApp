Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post   '/create',   to: 'comments#create'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users do
    resources :comments
  end

  resources :microposts do
    resources :comments
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts
  resources :relationships,       only: [:create, :destroy]
  resources :comments,            only: [:create, :destroy]
end
