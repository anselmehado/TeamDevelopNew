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



end
