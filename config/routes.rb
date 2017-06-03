Rails.application.routes.draw do

  root 'posts#index'
  patch '/users/:id/edit_password' => 'users#edit_password', as: :edit_password

  get 'posts/hot' => 'posts#hot', as: :hot

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
