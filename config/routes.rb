Rails.application.routes.draw do
  devise_for :accounts, controllers:{registrations: 'accounts/registrations'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to:"books#index"
  resources :books do
    collection do
      get :search
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
