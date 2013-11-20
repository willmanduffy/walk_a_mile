WalkAMile::Application.routes.draw do
  root to: 'products#index'

  resources :products, only: [:index] do
    delete :remove
  end

  resources :products_users, only: [:create]

  resource :user, only: [], as: :current_user do
    get :cart
  end
end
