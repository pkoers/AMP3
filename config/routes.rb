Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :entries
  delete "/entries/:id", to: "entries#destroy", as: "delete_entry"

  resources :documents
  post "/documents/new", to: "documents#create"
end
