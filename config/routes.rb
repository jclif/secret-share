SecretShareAjax::Application.routes.draw do
  resources :users, only: [:create, :new, :show, :index] do
    resources :secrets, only: [:new]
  end

  resource :session, only: [:create, :destroy, :new]

  resources :secrets, only: [:create]

  resources :friendships, only: [:create, :destroy]


  root :to => "users#show"
end
