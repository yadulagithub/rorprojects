



Rails.application.routes.draw do
  root 'authors#index'
  # simple , pass id to corresponding methods to get parent
  resources :authors
  resources :posts
  resources :comments

  # using nested routes 
  # Post belongs to author
  # resources :authors do
  #   # comment belong to Post
  #   resources :posts do
  #     resources :comments
  #   end

  # end  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
