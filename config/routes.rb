Rails.application.routes.draw do
  root to: "departments#index"

  resources :departments, only: %i[index new create edit update destroy] do
    resources :users, shallow: true
  end

  resources :users do
    resources :timecard, only: %i[index new create edit update destroy]
  end
end
