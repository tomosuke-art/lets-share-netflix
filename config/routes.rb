Rails.application.routes.draw do
  
  devise_for :users
  delete 'posts/:id' => 'posts#destroy'
  get "posts/index" => "posts#index"
  get "posts/indexa" => "posts#indexa"
  get "posts/indexb" => "posts#indexb"
  get "posts/indexc" => "posts#indexc"
  get "posts/indexd" => "posts#indexd"
  get "/"=>"home#top" 
  root 'home#top'
  #get "favorites/create" => "favorites#create"
  #get "favorites/destroy" => "favorites#destroy"

  resources :posts, only:[:new,:create,:show] 
   

  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
