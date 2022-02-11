Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'groups#index'
    resources :users, only:  [:index]
    resources :groups  do
      resources :group_records, only:  [:create, :destroy]
    end
    resources :records,  only:  [:new, :create]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
