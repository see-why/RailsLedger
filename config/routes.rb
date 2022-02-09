Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "user#index"
    resources :groups  do
      resources :group_records, only:  [:create, :destroy]
    end
    resources :records  
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
