Rails.application.routes.draw do
  get 'labels/index'
  get 'labels/show'
  get 'labels/update'
  get 'labels/new'
  get 'labels/edit'
  get 'labels/destroy'
  get 'sessions/new'
  root "tasks#index"
  resources :tasks

  resources :users, only: [:new, :create, :show, :update, :edit]
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
  resources :users

end

match "/404", to: "errors#not_found", via: :all
match "/500", to: "errors#internal_server_error", via: :all



end
