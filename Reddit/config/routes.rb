Rails.application.routes.draw do
  root to: redirect("/subs")

  resources :users, only: [:create, :new, :edit, :show, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, only: [:create, :new, :edit, :show, :update, :index] do
    resources :posts, only: [:new]
  end
  resources :posts, only: [:create, :edit, :show, :update, :destroy]
end
