Rails.application.routes.draw do
  devise_for :accounts, controllers:{registrations: 'accounts/registrations'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to:"books#index"
  get 'books/cart', to: 'books#cart', as: 'cart'
  post 'books/add_to_cart', to: 'books#add_to_cart',as:'add_to_cart'
  delete 'books/remove_from_cart',to:'books#remove_from_cart',as:'remove_from_cart'
  post 'books/modify_add_cart', to: 'books#modify_add_cart',as: 'modify_add_cart'
  resources :books do
    collection do
      get :search
      get :new_release
      get :recently_update
    end
  end
  resources :categories 
  # resources :horses, only: :show do
  #   collection do
  #     get :search
  #   end
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
