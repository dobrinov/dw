Rails.application.routes.draw do
  resources :jobs, only: %i(index show new create) do
    get :preview, on: :collection
  end

  get :contact, to: 'static_pages#contact'

  root to: 'jobs#index'
end
