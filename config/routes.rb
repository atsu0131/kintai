Rails.application.routes.draw do
  root to: "departments#index"

  resources :departments, only: %i[index new create edit update destroy] do
    resources :approvers, shallow: true, only: %i[new edit update]
    resources :users, shallow: true do
      resources :timecards
    end
  end
end
