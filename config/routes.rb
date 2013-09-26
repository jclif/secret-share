SecretShareAjax::Application.routes.draw do
  resources :users, only: [:create, :new, :show, :index]

  resource :session, only: [:create, :destroy, :new]

  resources :friendships, only: [:create, :destroy]

  resources :secrets, only: [:create]

  resources :tags, only: [:create]

  root :to => "users#show"
end
