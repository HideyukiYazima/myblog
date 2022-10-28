Rails.application.routes.draw do
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  root 'posts#index'
  
  # ユーザ―関連
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  # ログイン・ログアウト関連
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

end
