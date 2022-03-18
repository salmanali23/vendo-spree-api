Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :carts, only: [:create] do
        member do
          post :add_item
        end
      end
    end
  end
end
