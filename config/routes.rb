Rails.application.routes.draw do
  root 'home#docs'

  resources :submissions, only: [:index, :show, :create], param: :token
  resources :problem_categories, only: [:index, :show, :create], param: :token
  resources :problems, only: [:index, :show, :create], param: :token
  resources :languages, only: [:index]
  resources :statuses, only: [:index]

  get 'system_info', to: 'info#system_info'
  get 'config_info', to: 'info#config_info'

  post 'authenticate', to: 'sessions#authenticate'
  post 'authorize', to: 'sessions#authorize'

  get 'workers', to: 'health#workers'

  scope :problem do
    post ':problem_id/import_test_data', to: 'problem_data#create'
  end
end
