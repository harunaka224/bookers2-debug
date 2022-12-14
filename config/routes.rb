Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "homes/about"=>"homes#about"
  get "relationships/followings"
  get "relationships/followers"
  get "/search", to: "searches#search"

  devise_for :users

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create,:destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create]
    delete "/users/:user_id/relationships" =>'relationships#destroy', as: 'user_relationship'
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

