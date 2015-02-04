Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  resources :lessons

  root to: 'lessons#index'
end
