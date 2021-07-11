Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'homes#top'
  get "about" => "homes#about"

   resources :users, only: [:edit,:update, :show]

    get "users/:id/alert" => "users#alert"
    patch "users/:id/withdraw" => "users#withdraw"

   resources :items

   resources :styles do
       resources :comments, only: [:create, :destroy]
   end


end
