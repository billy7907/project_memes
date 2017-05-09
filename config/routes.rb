Rails.application.routes.draw do

  root 'posts#index'

  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
  end


end
