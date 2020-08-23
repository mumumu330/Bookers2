Rails.application.routes.draw do
  get 'books/top'
  get 'home/about'
  get 'books/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books 
  resources :users
  root 'books#top'

end