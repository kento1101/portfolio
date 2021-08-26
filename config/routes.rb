Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'

   resources :users, only: [:edit,:update, :show] do
    member do
    get 'alert' => "users#alert", as: 'alert'
    get 'likes' => 'users#likes', as: 'likes'
    get 'comments' => 'users#comments', as: 'comments'
    patch 'withdraw' => "users#withdraw", as: 'withdraw'
    end
    resource :relationships, only: [:create, :destroy]
   end

    get '/users/:id/followings' => 'users#followings', as: 'followings'
     get '/users/:id/followers' => 'users#followers', as: 'followers'

   resources :items

   resources :styles do
       resource :favorites, only: [:create, :destroy]
       resources :comments, only: [:create, :destroy]
   end

   get 'search' => 'styles#search', as: 'search'


end



