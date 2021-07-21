Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'homes#top'
  get "about" => "homes#about"

   resources :users, only: [:edit,:update, :show] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'likes' => 'users#likes', as: 'likes'
     get 'comments' => 'users#comments', as: 'comments'

   end

    get "users/:id/alert" => "users#alert", as: 'alert'
    patch "users/:id/withdraw" => "users#withdraw", as: 'withdraw'


   resources :items

   resources :styles do
       resource :favorites, only: [:create, :destroy]
       resources :comments, only: [:create, :destroy]
   end


end
