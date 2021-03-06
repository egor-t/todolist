Rails.application.routes.draw do
  root to: "lists#index"
  
  devise_for :users
  resources :lists do
    resources :tasks, only: [:new, :create, :destroy]
  end
  resources :tasks, only: [:edit, :update]
  get 'archive', to: 'tasks#archive', as: :archived_tasks
  get 'today', to: 'tasks#today', as: :today_tasks
  get 'tasks', to: 'tasks#index', as: :all_tasks
  put 'complete/:id', to: 'tasks#complete', as: :complete_task
end
