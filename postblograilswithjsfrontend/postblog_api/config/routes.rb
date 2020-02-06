



Rails.application.routes.draw do
  root 'authors#index'
  # simple , pass id to corresponding methods to get parent
  # nested routes
  resources :authors  do
    resources :posts do
      resources :comments
    end
  end
  # resources :authors
  # resources :posts
  # resources :comments

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
