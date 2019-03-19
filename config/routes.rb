Rails.application.routes.draw do
  get 'welcome/index'
  get '/tasks/:id/confirm', to: 'tasks#confirm', as: 'confirm'
  devise_for :users
  resources  :tasks 
  root to: redirect('tasks')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
