Rails.application.routes.draw do
  root to: 'lists#index'
  get '/show', to: 'lists#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
