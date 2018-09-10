Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :lists do
    resources :tasks
    put 'complete/:id', to: 'tasks#complete', as: :complete_task
  end
  get 'archive', to: 'tasks#archive', as: :archived_task
end
