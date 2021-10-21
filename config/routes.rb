Rails.application.routes.draw do
  resources :shop_lists, only: [:index, :create, :update, :destroy] do
    resources :products, only: [:index, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
