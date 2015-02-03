Rails.application.routes.draw do
  resources :questions
  resources :lessons

  root to: 'lessons#index'
end
