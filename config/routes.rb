Rails.application.routes.draw do

  resources :departments do
    resources :users, shallow: true
  end
  resources :timecards
end
