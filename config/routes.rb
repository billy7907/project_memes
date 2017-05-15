Rails.application.routes.draw do

  root 'posts#index'

  resources :posts, shallow: true do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, except: [:destroy] do
    resources :likes, only: :index
    delete :destroy, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
