Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists do
    resources :bookmarks, only: [:new]
  end
end
