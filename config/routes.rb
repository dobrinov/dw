Rails.application.routes.draw do
  resources :jobs, only: %i(index show new create) do
    get :preview, on: :collection
  end

  root to: 'jobs#index'
end
