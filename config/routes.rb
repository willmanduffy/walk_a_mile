WalkAMile::Application.routes.draw do
  root to: 'products#index'

  resources :products, only: [:index]

  resource :user, only: [], as: :current_user do
    get :cart
  end
end
