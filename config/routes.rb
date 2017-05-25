Rails.application.routes.draw do

  root 'posts#index'

  get 'posts/fresh' => 'posts#fresh', as: :fresh

  resources :posts, shallow: true do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create, :update, :destroy]
  end

  resources :users, except: [:destroy] do
    delete :destroy, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
