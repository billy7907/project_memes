Rails.application.routes.draw do

  root 'posts#index'

  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new] do
    delete :destroy, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
