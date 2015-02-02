Rails.application.routes.draw do
  resources :lessons

  root to: 'lessons#index'
end
