Rails.application.routes.draw do
  # 最上位にしてないとusersの方とごちゃ混ぜになる?
  devise_for :users

  #get 'users/edit'
  #get 'users/index'
  #get 'users/show'
  resources :users, only: [:show, :edit, :index, :update]

  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  #get 'homes/top'
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'home_about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
